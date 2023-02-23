
import 'package:clean_architecture_flutter/features/authentication/domain/entities/auth_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';

class AuthenticationLocalDatasource {

  late UserEntity userdddd;

  Future<UserEntity> signInWithEmailAndPassword(AuthEntity auth) async {
     userdddd = UserEntity(email: 'saulo@mail.com', name: 'saulo', uid: '124dsd5');
    return userdddd;
  }

  Future<UserEntity> getUser() async {
    return userdddd;
  }

}