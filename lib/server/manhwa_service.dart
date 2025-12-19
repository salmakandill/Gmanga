import 'package:dio/dio.dart';
import 'manhwa_model.dart';

class MangaService {
  final Dio _dio = Dio();
  final String apiUrl = 'https://graphql.anilist.co';

  Future<List<MangaModel>> getAniListData({int limit = 50, String? genre, String? search}) async {
    String query = """
    query (\$limit: Int, \$genre: String, \$search: String) {
      Page(page: 1, perPage: \$limit) {
        media(type: MANGA, genre: \$genre, search: \$search, sort: POPULARITY_DESC, countryOfOrigin_in: ["KR", "CN"]) {
          id
          title { english romaji }
          coverImage { large }
          description
          averageScore
          siteUrl
        }
      }
    }
    """;

    try {
      var response = await _dio.post(apiUrl, data: {
        'query': query,
        'variables': {'limit': limit, 'genre': genre, 'search': search},
      });

      List data = response.data['data']['Page']['media'];
      return data.map((e) => MangaModel.fromJson(e)).toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  Future<List<MangaModel>> getManhwaOnly() => getAniListData(limit: 50);
}