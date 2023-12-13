import 'package:ny_times_app/library.dart';
import 'package:ny_times_app/utils/helpers/api_base_helper.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => ApiBaseHelper());
  getIt.registerLazySingleton(() => ArticleRepository(getIt()));
  getIt.registerFactory(() => ArticlesViewModel(getIt()));
}
