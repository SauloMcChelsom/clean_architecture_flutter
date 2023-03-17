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
  group('authentication_repository_imp.dart', () {
    group('authenticate', () {
      test('Should authenticate user with success [remote]', () async {
        const String email = '2033.xyz@gmail.com';
        //when
        final result = await todoRepositoryImpl.authenticate(username: email, password: '123456789');

        //then
        expect(result.getMessage(), 'successful authentication');
      });

      test('Should failed, user ou email not exist [remote]', () async {
        const String email = 'saulo@mail.com';
        //when
        final result = await todoRepositoryImpl.authenticate(username: email, password: '123456789');

        //then
        expect(result.getMessage(), 'user does not exist');
      });

      test('Should failed, Different password [remote]', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await todoRepositoryImpl.authenticate(username: email, password: 'abcderc8');

        //then
        expect(result.getMessage(), 'password does not match');
      });

      test('Should failed, password should be at least 8 characters [remote]', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await todoRepositoryImpl.authenticate(username: email, password: 'abcderc');

        //then
        expect(result.getMessage(), 'password should be at least 8 characters');
      });

      test('Should failed, password should be at max 12 characters [remote]', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await todoRepositoryImpl.authenticate(username: email, password: 'abcdercabcdercabcderc');

        //then
        expect(result.getMessage(), 'password should be at max 12 characters');
      });
    });
  });
}
