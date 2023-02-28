import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthenticationRepositoryImp todoRepositoryImpl;

  //Esta função será chamada antes de cada teste ser executado
  setUp(() {
    todoRepositoryImpl = AuthenticationRepositoryImp(localDatasource: AuthenticationLocalDatasource());
  });

  //Esta função será chamada após a execução de cada teste
  tearDown(() {});

  test('Should auth sucess', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123');

    //when
    final result = await todoRepositoryImpl.authenticate(username: email, password: '123');

    //then
    expect(result.message, 'successful authentication');
  });

  test('Should auth error password', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123');

    //when
    final result = await todoRepositoryImpl.authenticate(username: email, password: '1233');

    //then
    expect(result.message, 'password does not match');
  });

  test('Should user not exist', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123');

    //when
    final result = await todoRepositoryImpl.authenticate(username: 'saulosilva@mail.com', password: '1233');

    //then
    expect(result.message, 'user does not exist');
  });
}
