import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/core/domain/usecase/usecase.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class GetCurrentUserUseCase implements TUseCase<void> {
  final AuthenticationRepository _authenticationRepository;
  GetCurrentUserUseCase(this._authenticationRepository);

  @override
  Future<ResponseEntity> call() async {
    return _authenticationRepository.getCurrentUser();
  }
}
