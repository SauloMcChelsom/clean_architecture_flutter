import 'package:clean_architecture_flutter/core/data/services/dio_http_service_imp.dart';
import 'package:clean_architecture_flutter/core/domain/services/http_service.dart';
import 'package:get_it/get_it.dart';

class Movies {
  static initialize(){
    GetIt getIt = GetIt.instance;

    // core
    getIt.registerLazySingleton<HttpService>(
      () => DioHttpServiceImp()
    );
  }
}