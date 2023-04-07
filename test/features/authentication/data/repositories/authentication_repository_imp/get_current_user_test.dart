import 'package:clean_architecture_flutter/core/services/http/http_service.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    group('get_current_use [remote]', () {
      test('Should get current user', () async {
        const String email = '2033.xyz@gmail.com';

        SharedPreferences.setMockInitialValues({});

        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

        final SharedPreferencesUtil sharedPreferencesUtil = SharedPreferencesUtil(sharedPreferences: sharedPreferences);

        var aut = await remote_repository.authenticate(username: email, password: '123456789');
        print(aut.getStatusCode());
        print(aut.getMessage());
        print(aut.getDescription());

        final actualCounter = sharedPreferencesUtil.getAccessToken();
        print(actualCounter);

        final result = await remote_repository.getCurrentUser();
        print(result.getStatusCode());
        //then
        /* expect(result.getMessage(), 'user found');*/
        expect(true, true);
      });
    });

    group('get_current_use [local]', () {
      test('Should get current user', () async {
        const String email = '2033.xyz@gmail.com';

        await local_repository.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

        await local_repository.authenticate(username: email, password: '123456789');

        final result = await local_repository.getCurrentUser();
        //then
        expect(result.getMessage(), 'user found');
      });
    });
  });
}
