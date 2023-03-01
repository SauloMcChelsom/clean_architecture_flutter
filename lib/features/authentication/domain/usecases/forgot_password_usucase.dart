import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/core/domain/usecase/usecase.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class ForgotPasswordUseCase implements TPUseCase<void, String> {
  final AuthenticationRepository _authenticationRepository;
  ForgotPasswordUseCase(this._authenticationRepository);

  @override
  Future<ResponseEntity> call(String email) async {
    return _authenticationRepository.forgotPassword(email);
  }
}
