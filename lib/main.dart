import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/library.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NY Times Most Popular Articles',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ArticleScreen(),
    );
  }
}
