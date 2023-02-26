import 'package:clean_architecture_flutter/features/authentication/domain/entities/auth_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
  Future<void> register({required String firstName, required String lastName, required String email, required String password});

  /// Authenticates a user using his [username] and [password]
  Future<void> authenticate(AuthEntity auth);

  /// Returns whether the [User] is authenticated.
  Future<bool> isAuthenticated();

  /// Returns whether the [User] is authenticated.
  Future<bool> isEmailAlreadyExists(String email);

  /// Returns the current authenticated [User].
  Future<UserEntity> getCurrentUser();

  /// Resets the password of a [User]
  Future<void> forgotPassword(String email);

  /// Logs out the [User]
  Future<void> logout();
}
