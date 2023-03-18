import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';

abstract class IAuthenticationDatasource {
  Future<ResponseEntity> register({required String firstName, required String lastName, required String email, required String password});

  Future<ResponseEntity> signInWithEmailAndPassword({required String username, required String password});

  Future<ResponseEntity> isEmailAlreadyExists(String email);

  Future<ResponseEntity> getUser();

  Future<ResponseEntity> forgotPassword(String email);

  Future<ResponseEntity> isAuthenticated();

  Future<ResponseEntity> logout();
}
