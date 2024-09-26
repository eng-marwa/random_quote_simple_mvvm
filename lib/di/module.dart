import 'package:get_it/get_it.dart';

import '../network/api_service.dart';
import '../view_model/random_quote_view_model.dart';

GetIt getIt = GetIt.instance;
void setupDependencies() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerFactory<RandomQuoteViewModel>(
      () => RandomQuoteViewModel(getIt<ApiService>()));
}
