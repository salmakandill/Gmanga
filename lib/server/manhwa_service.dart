import 'package:dio/dio.dart';
import '../server/manhwa_model.dart';

class MangaService {
  final Dio _dio = Dio();

  Future<List<MangaModel>> getAniListData({int limit = 50, String? genre}) async {
    const String url = 'https://graphql.anilist.co';

    String query = """
    query (\$limit: Int, \$genre: String) {
      Page(page: 1, perPage: \$limit) {
        media(type: MANGA, genre: \$genre, sort: POPULARITY_DESC) {
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
      var response = await _dio.post(url, data: {
        'query': query,
        'variables': {
          'limit': limit,
          'genre': genre, 
        },
      });

      List data = response.data['data']['Page']['media'];
      return data.map((e) => MangaModel.fromJson(e)).toList();
    } catch (e) {
      print("AniList Error: $e");
      return [];
    }
  }
  Future<List<MangaModel>> getManhwaOnly() => getAniListData(limit: 50);
}