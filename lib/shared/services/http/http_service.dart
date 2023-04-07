import 'package:clean_architecture_flutter/shared/model/response_entity.dart';

abstract class IHttpService {
  final interceptors = <MyInterceptor>[];

  Future<ResponseEntity> get(String url);
  Future<ResponseEntity> post(String url, {dynamic data});
  Future<ResponseEntity> put(String url, {dynamic data});
  Future<ResponseEntity> patch(String url, {dynamic data});
  Future<ResponseEntity> delete(String url, {dynamic data});
}

abstract class MyInterceptor<TRequest, TResponse, TError> {
  Future<TRequest> onRequest(TRequest request);
  Future<TResponse> onResponse(TResponse response);
  Future<TError> onError(TError error);
}
