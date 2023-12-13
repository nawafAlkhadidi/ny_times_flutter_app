import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/library.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(articlesViewModelProvider);
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.search), Icon(Icons.more_vert_rounded)],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("NY Times Most Popular")),
      body: FutureBuilder<List<ArticleModel>>(
        future: viewModel.fetchArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailsScreen(
                          article: articles[index],
                        ),
                      ),
                    );

                    // print(viewModel.xxdd);
                  },
                  child: ArticleCard(
                      byline: article.byline!,
                      publishedDate: article.publishedDate!,
                      title: article.title!,
                      sections: article.section!,
                      imageUrl: article.media!.isEmpty ? imagePlaceholder : article.media!.first.mediaMetadata!.first.url!),
                );
              },
            );
          }
        },
      ),
    );
  }
}
