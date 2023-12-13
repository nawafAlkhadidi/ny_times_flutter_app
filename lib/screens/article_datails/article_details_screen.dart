import 'package:ny_times_app/library.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.media!.isEmpty
                ? const SizedBox()
                : Center(
                    child: Image.network(
                      article.media!.first.mediaMetadata!.first.url!,
                      fit: BoxFit.contain,
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value:
                                loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                          ),
                        );
                      },
                    ),
                  ),
            Text(
              article.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(article.abstract!),
            const SizedBox(height: 8),
            Text('By: ${article.byline}'),
            const SizedBox(height: 8),
            Text('Published: ${article.publishedDate}'),
          ],
        ),
      ),
    );
  }
}
