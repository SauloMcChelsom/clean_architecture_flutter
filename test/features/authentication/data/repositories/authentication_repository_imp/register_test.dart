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
    group('register [remote]', () {
      test('Should register user with success', () async {
        final id =
            '${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().microsecond}${DateTime.now().millisecond}${DateTime.now().second}${DateTime.now().minute}${DateTime.now().hour}';
        final String email = 'saulo.silva_${id}@test.com.br';
        //when
        final result = await remote_repository.register(email: email, password: 'abcdercabcde', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'successful register');
      });

      test('Should failed, email already exist', () async {
        const String email = '2033.xyz@gmail.com';
        //when
        final result = await remote_repository.register(email: email, password: 'abcdercabcde', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'email already exist');
      });

      test('Should failed, password should be at least 8 characters', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await remote_repository.register(email: email, password: 'abc', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'password should be at least 8 characters');
      });

      test('Should failed, password should be at max 12 characters', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await remote_repository.register(email: email, password: 'abcdercabcdercabcderc', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'password should be at max 12 characters');
      });

      test('Should failed, email must be an email', () async {
        final id =
            '${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().microsecond}${DateTime.now().millisecond}${DateTime.now().second}${DateTime.now().minute}${DateTime.now().hour}';
        final String email = 'saulo.silva_${id}';
        //when
        final result = await remote_repository.register(email: email, password: 'abcdercabcde', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'email must be an email');
      });

      test('Should failed, name must be longer than or equal to 2 characters', () async {
        final id =
            '${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().microsecond}${DateTime.now().millisecond}${DateTime.now().second}${DateTime.now().minute}${DateTime.now().hour}';
        final String email = 'saulo.silva_${id}@test.com';
        //when
        final result = await remote_repository.register(email: email, password: 'abcdercabcde', firstName: '', lastName: '');

        //then
        expect(result.getMessage(), 'name must be longer than or equal to 2 characters');
      });
    });

    group('register [local]', () {
      test('Should register user with success', () async {
        final id =
            '${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().microsecond}${DateTime.now().millisecond}${DateTime.now().second}${DateTime.now().minute}${DateTime.now().hour}';
        final String email = 'saulo.silva_${id}@test.com.br';
        //when
        final result = await local_repository.register(email: email, password: 'abcdercabcde', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'successful register');
      });

      test('Should failed, email already exist', () async {
        const String email = '2033.xyz@gmail.com';
        local_datasource.user.add(UserEntity(
            email: email,
            id: 155,
            is_active: false,
            last_login: '',
            name: 'saulo',
            password: 'vgfgdfgf',
            providers: '',
            role: '',
            timestamp: '',
            uid: '',
            updated_at: ''));
        //when
        final result = await local_repository.register(email: email, password: 'abcdercabcde', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'email already exist');
      });

      test('Should failed, password should be at least 8 characters', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await local_repository.register(email: email, password: 'abc', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'password should be at least 8 characters');
      });

      test('Should failed, password should be at max 12 characters', () async {
        const String email = '2033.xyz@gmail.com';

        //when
        final result = await local_repository.register(email: email, password: 'abcdercabcdercabcderc', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'password should be at max 12 characters');
      });

      test('Should failed, email must be an email', () async {
        final id =
            '${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().microsecond}${DateTime.now().millisecond}${DateTime.now().second}${DateTime.now().minute}${DateTime.now().hour}';
        local_datasource.user.clear();
        //when
        final result = await local_repository.register(email: '', password: 'abcdercabcde', firstName: 'saulo', lastName: 'silva');

        //then
        expect(result.getMessage(), 'email must be an email');
      });

      test('Should failed, name must be longer than or equal to 2 characters', () async {
        final id =
            '${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().microsecond}${DateTime.now().millisecond}${DateTime.now().second}${DateTime.now().minute}${DateTime.now().hour}';
        final String email = 'saulo.silva_${id}@test.com';
        local_datasource.user.clear();
        //when
        final result = await local_repository.register(email: email, password: 'abcdercabcde', firstName: '', lastName: '');

        //then
        expect(result.getMessage(), 'name must be longer than or equal to 2 characters');
      });
    });
  });
}
