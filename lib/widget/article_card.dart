import 'package:ny_times_app/library.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.publishedDate,
    required this.title,
    required this.sections,
    required this.byline,
    required this.imageUrl,
  });
  final String title;
  final String publishedDate;
  final String byline;
  final String sections;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(size.width * 0.03),
        width: size.width,
        height: size.height < 700 ? size.height * 0.19 : size.height * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                backgroundColor: Colors.black54,
                maxRadius: 30,
                child: ClipOval(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
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
                )),
            Container(
              width: size.width * 0.6,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2, style: const TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(byline, maxLines: 1, overflow: TextOverflow.ellipsis),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(sections.toUpperCase()),
                          Text(publishedDate),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 20),
          ],
        ));
  }
}
