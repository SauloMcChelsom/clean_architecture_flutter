import 'package:get_it/get_it.dart';

class Movies {
  static initialize() {
    GetIt getIt = GetIt.instance;

    // core
    //getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());
  }
}
