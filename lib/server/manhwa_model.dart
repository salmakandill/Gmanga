class MangaModel {
  final int id;
  final String title;
  final String image;
  final String description;
  final String url;
  final String score;

  MangaModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.url,
    required this.score,
  });

  factory MangaModel.fromJson(Map<String, dynamic> json) {

    String cleanDescription(String? htmlString) {
      if (htmlString == null || htmlString.isEmpty)
        return "No description available.";
      return htmlString
          .replaceAll('<br>', '\n')
          .replaceAll(RegExp(r'<[^>]*>'), '')
          .replaceAll('&nbsp;', ' ')
          .trim();
    }

    return MangaModel(
      id: json['id'] ?? 0,
      title: json['title']['english'] ?? json['title']['romaji'] ?? 'Unknown',
      image: json['coverImage']['large'] ?? '',
      description: cleanDescription(json['description']),
      url: json['siteUrl'] ?? '',
      score: json['averageScore'] != null
          ? (json['averageScore'] / 10).toStringAsFixed(1)
          : '0.0',
    );
  }
}
