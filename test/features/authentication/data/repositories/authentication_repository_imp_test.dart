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

  test('Should register one user with success', () async {
    const String email = 'saulo@mail.com';
    final result = await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789de');

    //then
    expect(result.getMessage(), 'successful register');
  });

  test('Should failed password min 8 characters', () async {
    const String email = 'saulo@mail.com';
    final result = await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123');

    //then
    expect(result.getMessage, 'password should be at least 8 characters');
  });

  test('Should failed password max 12 characters', () async {
    const String email = 'saulo@mail.com';
    final result = await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '1255555555555555555555553');

    //then
    expect(result.getMessage, 'password should be at max 12 characters');
  });

  test('Should register one user', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

    //when
    final result = await todoRepositoryImpl.authenticate(username: email, password: '123456789');

    //then
    expect(result.getMessage, 'successful authentication');
  });

  test('Should failed password does not match', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

    //when
    final result = await todoRepositoryImpl.authenticate(username: email, password: 'abcderc');

    //then
    expect(result.getMessage, 'password does not match');
  });

  test('Should user not exist', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

    //when
    final result = await todoRepositoryImpl.authenticate(username: 'abcde@mail.com', password: '123456789');

    //then
    expect(result.getMessage, 'user does not exist');
  });

  test('Should check if email is in use', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

    final result = await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

    //then
    expect(result.getMessage, 'email already in use');
  });

  test('Should send email forgot password', () async {
    const String email = 'saulo@mail.com';
    final result = await todoRepositoryImpl.forgotPassword(email);
    //then
    expect(result.getMessage, 'email send with success');
  });

  test('Should get current user', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

    await todoRepositoryImpl.authenticate(username: email, password: '123456789');

    final result = await todoRepositoryImpl.getCurrentUser();
    //then
    expect(result.getMessage, 'user found');
  });

  test('Should failed get current user', () async {
    final result = await todoRepositoryImpl.getCurrentUser();
    //then
    expect(result.getMessage, 'user not found');
  });

  test('Should check if is Authenticated', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');

    await todoRepositoryImpl.authenticate(username: email, password: '123456789');
    final result = await todoRepositoryImpl.isAuthenticated();
    //then
    expect(result.getMessage, 'user authenticated');
  });

  test('Should failed check if is Authenticated', () async {
    final result = await todoRepositoryImpl.isAuthenticated();
    //then
    expect(result.getMessage, 'user not authenticated');
  });

  test('Should make logout', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');
    await todoRepositoryImpl.authenticate(username: email, password: '123456789');

    final result = await todoRepositoryImpl.logout();
    //then
    expect(result.getMessage, 'user logout with success');
  });

  test('Should check is email already exists', () async {
    const String email = 'saulo@mail.com';
    await todoRepositoryImpl.register(email: email, firstName: 'saulo', lastName: 'silva', password: '123456789');
    await todoRepositoryImpl.authenticate(username: email, password: '123456789');

    final result = await todoRepositoryImpl.isEmailAlreadyExists(email);
    //then
    expect(result.getMessage, 'email found');
  });

  test('Should failed is email already exists', () async {
    final result = await todoRepositoryImpl.isEmailAlreadyExists('abcd@mail.com');
    //then
    expect(result.getMessage, 'email not found');
  });
}
