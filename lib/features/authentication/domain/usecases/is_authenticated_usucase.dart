import 'package:clean_architecture_flutter/core/domain/usecase/usecase.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/repositories/authentication_repository.dart';

class IsAuthenticatedUseCase implements TUseCase<void> {

  final AuthenticationRepository _authenticationRepository;
  IsAuthenticatedUseCase(this._authenticationRepository);
  
  @override
  Future<bool> call() async {
    return _authenticationRepository.isAuthenticated();
  }
}