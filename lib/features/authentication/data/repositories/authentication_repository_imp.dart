import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  //final AuthenticationLocalDatasource datasource;
  final AuthenticationRemoteDatasource datasource;

  AuthenticationRepositoryImp({required this.datasource});

  @override
  Future<ResponseEntity> register({required String firstName, required String lastName, required String email, required String password}) async {
    return await datasource.register(email: email, firstName: firstName, lastName: lastName, password: password);
  }

  @override
  Future<ResponseEntity> authenticate({required String username, required String password}) async {
    return await datasource.signInWithEmailAndPassword(username: username, password: password);
  }

  @override
  Future<ResponseEntity> forgotPassword(String email) async {
    return await datasource.forgotPassword(email);
  }

  @override
  Future<ResponseEntity> getCurrentUser() async {
    return await datasource.getUser();
  }

  @override
  Future<ResponseEntity> isAuthenticated() async {
    return await datasource.isAuthenticated();
  }

  @override
  Future<ResponseEntity> logout() async {
    return await datasource.logout();
  }

  @override
  Future<ResponseEntity> isEmailAlreadyExists(String email) async {
    return await datasource.isEmailAlreadyExists(email);
  }
}
