import 'package:ny_times_app/library.dart';
import 'package:ny_times_app/utils/helpers/api_base_helper.dart';

class ArticleRepository {
  final ApiBaseHelper httpClient;

  ArticleRepository(this.httpClient);

  Future<List<ArticleModel>> fetchArticles() async {
    List<ArticleModel> articleModelList = [];
    final response = await httpClient.get(endpoint: mostViewedaAllsection.replaceAll(":id", "all-sections"));
    if (response.statusCode == 200) {
      articleModelList = (response.data['results'] as List).map((e) => ArticleModel.fromJson(e)).toList();
      return articleModelList;
    } else {
      throw Exception('Failed to fetch articles');
    }
  }
}
