import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/library.dart';

final articlesViewModelProvider = Provider((ref) => getIt<ArticlesViewModel>());

class ArticlesViewModel {
  final ArticleRepository articleRepository;
  // constructor
  ArticlesViewModel(this.articleRepository);

  Future<List<ArticleModel>> fetchArticles() {
    return articleRepository.fetchArticles();
  }
}
