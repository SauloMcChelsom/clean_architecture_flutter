import 'package:clean_architecture_flutter/shared/services/http/http_service_imp.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthenticationRepositoryImp remote_repository;
  late AuthenticationRepositoryImp local_repository;

  AuthenticationLocalDatasource local_datasource = AuthenticationLocalDatasource();
  AuthenticationRemoteDatasource remote_datasource = AuthenticationRemoteDatasource(HttpService());

  //Esta função será chamada antes de cada teste ser executado
  setUp(() {
    remote_repository = AuthenticationRepositoryImp(datasource: remote_datasource);
    local_repository = AuthenticationRepositoryImp(datasource: local_datasource);
  });

  //Esta função será chamada após a execução de cada teste
  tearDown(() {});
  group('authentication_repository_imp.dart', () {
    group('fotgot_password [remote]', () {
      test('Should send email, forgot password', () async {
        const String email = '2033.xyz@gmail.com';
        final result = await remote_repository.forgotPassword(email);
        //then
        expect(result.getMessage(), 'email send with success');
      });
    });

    group('fotgot_password [local]', () {
      test('Should send email, forgot password', () async {
        const String email = '2033.xyz@gmail.com';
        final result = await local_repository.forgotPassword(email);
        //then
        expect(result.getMessage(), 'email send with success');
      });
    });
  });
}
