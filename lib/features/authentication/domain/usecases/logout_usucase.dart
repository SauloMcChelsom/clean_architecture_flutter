import 'package:clean_architecture_flutter/core/domain/usecase/usecase.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class LogoutUseCase implements TUseCase<void> {

  final AuthenticationRepository _authenticationRepository;
  LogoutUseCase(this._authenticationRepository);
  
  @override
  Future<void> call() async {
    return _authenticationRepository.logout();
  }
}