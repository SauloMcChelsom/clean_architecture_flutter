import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/auth_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';

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

    //when
    var auth = AuthEntity(email: 'sss', password: '123');
    final result = await todoRepositoryImpl.authenticate(auth);
    UserEntity user = await todoRepositoryImpl.getCurrentUser();
    print(user.email);
    //then
    expect(user, isInstanceOf<UserEntity>());
  });

 
}
