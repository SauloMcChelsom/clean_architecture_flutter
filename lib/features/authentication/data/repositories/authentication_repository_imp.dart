import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final AuthenticationLocalDatasource localDatasource;

  AuthenticationRepositoryImp({required this.localDatasource});

  @override
  Future<ResponseEntity> authenticate({required String username, required String password}) async {
    return await localDatasource.signInWithEmailAndPassword(username: username, password: password);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await localDatasource.forgotPassword(email);
  }

  @override
  Future<UserEntity> getCurrentUser() async {
    return await localDatasource.getUser();
  }

  @override
  Future<bool> isAuthenticated() async {
    return await localDatasource.isAuthenticated();
  }

  @override
  Future<void> logout() async {
    return await localDatasource.logout();
  }

  @override
  Future<void> register({required String firstName, required String lastName, required String email, required String password}) async {
    await localDatasource.register(email: email, firstName: firstName, lastName: lastName, password: password);
  }

  @override
  Future<bool> isEmailAlreadyExists(String email) async {
    return await localDatasource.isEmailAlreadyExists(email);
  }
}
