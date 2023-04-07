import 'package:clean_architecture_flutter/shared/services/http/http_service_imp.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
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
    group('authenticate [remote]', () {
      test('Should authenticate user with success', () async {
        const String email = '2033.xyz@gmail.com';
        //when
        final result = await remote_repository.authenticate(username: email, password: '123456789');

        //then
        expect(result.getMessage(), 'successful authentication');
      });

      test('Should failed, user ou email not exist', () async {
        const String email = 'saulo@mail.com';
        //when
        final result = await remote_repository.authenticate(username: email, password: '123456789');

        //then
        expect(result.getMessage(), 'user does not exist');
      });

      test('Should failed, Different password', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await remote_repository.authenticate(username: email, password: 'abcderc8');

        //then
        expect(result.getMessage(), 'password does not match');
      });

      test('Should failed, password should be at least 8 characters', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await remote_repository.authenticate(username: email, password: 'abcderc');

        //then
        expect(result.getMessage(), 'password should be at least 8 characters');
      });

      test('Should failed, password should be at max 12 characters', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await remote_repository.authenticate(username: email, password: 'abcdercabcdercabcderc');

        //then
        expect(result.getMessage(), 'password should be at max 12 characters');
      });
    });

    group('authenticate [local]', () {
      test('Should authenticate user with success', () async {
        const String email = '2033.xyz@gmail.com';
        await local_repository.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

        //when
        final result = await local_repository.authenticate(username: email, password: '123456789');

        //then
        expect(result.getMessage(), 'successful authentication');
      });

      test('Should failed, user ou email not exist', () async {
        const String email = 'saulo@mail.com.br';
        await local_repository.register(email: '2033.xyz@gmail.com', firstName: 'saulo', lastName: 'silva', password: '123456789');
        //when
        final result = await local_repository.authenticate(username: email, password: '123456789');

        //then
        expect(result.getMessage(), 'user does not exist');
      });

      test('Should failed, Different password', () async {
        const String email = '2033.xyz@gmail.com';
        await local_repository.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');
        //when
        final result = await local_repository.authenticate(username: email, password: 'abcderc8');

        //then
        expect(result.getMessage(), 'password does not match');
      });

      test('Should failed, password should be at least 8 characters', () async {
        const String email = '2033.xyz@gmail.com';
        //when
        final result = await local_repository.authenticate(username: email, password: 'abcderc');

        //then
        expect(result.getMessage(), 'password should be at least 8 characters');
      });

      test('Should failed, password should be at max 12 characters', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await local_repository.authenticate(username: email, password: 'abcdercabcdercabcderc');

        //then
        expect(result.getMessage(), 'password should be at max 12 characters');
      });
    });
  });
}
