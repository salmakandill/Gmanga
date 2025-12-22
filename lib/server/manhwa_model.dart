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
    return MangaModel(
      id: json['id'] ?? 0,

      title: json['title']['english'] ?? json['title']['romaji'] ?? 'Unknown',
      image: json['coverImage']['large'] ?? '',
      description: json['description'] ?? 'No description available.',
      url: json['siteUrl'] ?? '',

      score: json['averageScore'] != null
          ? (json['averageScore'] / 10).toStringAsFixed(1)
          : '0.0',
    );
  }
}
