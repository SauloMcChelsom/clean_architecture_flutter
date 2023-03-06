import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';

abstract class AuthenticationRepository {
  Future<ResponseEntity> register({required String firstName, required String lastName, required String email, required String password});

  /// Authenticates a user using his [username] and [password]
  Future<ResponseEntity> authenticate({required String username, required String password});

  /// Returns whether the [User] is authenticated.
  Future<ResponseEntity> isAuthenticated();

  /// Returns whether the [User] is authenticated.
  Future<ResponseEntity> isEmailAlreadyExists(String email);

  /// Returns the current authenticated [User].
  Future<ResponseEntity> getCurrentUser();

  /// Resets the password of a [User]
  Future<ResponseEntity> forgotPassword(String email);

  /// Logs out the [User]
  Future<ResponseEntity> logout();
}
