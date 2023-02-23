import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/auth_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthenticationRepositoryImp todoRepositoryImpl;

  //Esta função será chamada antes de cada teste ser executado
  setUp(() {
    todoRepositoryImpl = AuthenticationRepositoryImp(
      localDatasource: AuthenticationLocalDatasource()
    );
  });

  //Esta função será chamada após a execução de cada teste
  tearDown(() {
   
  });

  test('Should get all todos from local datasource', () async {

    await todoRepositoryImpl.register(
      email: 'saulo@mail.com', 
      firstName: 'saulo', 
      lastName: 'silva', 
      password: '123'
    );

    //when
    var auth = AuthEntity(email: 'saulo@mail.com', password: '123');
    final result = await todoRepositoryImpl.authenticate(auth);
    UserEntity user = await todoRepositoryImpl.getCurrentUser();
    print(user.email);
    print(user.name);
    print(user.uid);
    //then
    expect(user, isInstanceOf<UserEntity>());
  });

 
}
