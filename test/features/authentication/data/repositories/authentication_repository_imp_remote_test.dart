import 'package:clean_architecture_flutter/core/services/http/http_service.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthenticationRepositoryImp todoRepositoryImpl;

  //Esta função será chamada antes de cada teste ser executado
  setUp(() {
    todoRepositoryImpl = AuthenticationRepositoryImp(datasource: AuthenticationRemoteDatasource(HttpService()));
  });

  //Esta função será chamada após a execução de cada teste
  tearDown(() {});
  test('Should check if is Authenticated', () async {
    const String email = 'saulo@mail.com';

    await todoRepositoryImpl.authenticate(username: email, password: '123456789');
    final result = await todoRepositoryImpl.isAuthenticated();
    //then
    expect(result.getMessage, 'user authenticated');
  });
}
