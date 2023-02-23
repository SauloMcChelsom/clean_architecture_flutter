
import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/auth_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp  implements  AuthenticationRepository {

  final AuthenticationLocalDatasource localDatasource;

  AuthenticationRepositoryImp({
    required this.localDatasource
  });

  @override
  Future<void> authenticate(AuthEntity auth) async {
    final UserEntity user = await localDatasource.signInWithEmailAndPassword(auth);
    print(user);
  }

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getCurrentUser() async {
    return await localDatasource.getUser();
  }

  @override
  Future<bool> isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register({required String firstName, required String lastName, required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

}