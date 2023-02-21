import 'package:clean_architecture_flutter/core/domain/services/http_service.dart';
import 'package:dio/dio.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;
  DioHttpServiceImp(){
    _dio = Dio(
     BaseOptions(
      baseUrl: 'https://api.themovi.org/4/',
      headers: {
        'content-type': 'application/json;charset=utf-8',
        'authorization': 'Bearer eyJnglfglfglfgf.ey656d65bg656o6dfd6'
      }
     ) 
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> ? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}