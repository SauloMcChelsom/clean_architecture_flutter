import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/core/domain/usecase/usecase.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/token_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticateUseCase implements TPUseCase<void, UserEntity> {
  final AuthenticationRepository _authenticationRepository;
  AuthenticateUseCase(this._authenticationRepository);

  @override
  Future<ResponseEntity> call(UserEntity user) async {
    return _authenticationRepository.authenticate(username: user.email, password: user.password);
  }
}
