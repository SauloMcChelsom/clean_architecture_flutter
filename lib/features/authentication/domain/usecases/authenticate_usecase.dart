import 'package:clean_architecture_flutter/core/domain/usecase/usecase.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/auth_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticateUseCase implements TPUseCase<void, AuthEntity> {

  final AuthenticationRepository _authenticationRepository;
  AuthenticateUseCase(this._authenticationRepository);
  
  @override
  Future<void> call(AuthEntity auth) async {
    return _authenticationRepository.authenticate(auth);
  }
}