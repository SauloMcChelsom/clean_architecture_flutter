
import 'package:clean_architecture_flutter/features/authentication/domain/entities/auth_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';

class AuthenticationLocalDatasource {

  List<UserEntity> user = [];

  Future<void> register({required String firstName, required String lastName, required String email, required String password}) async {
    user.add(UserEntity(email: email, name: '${firstName} ${lastName}', uid: DateTime.now().toString()));
  }

  Future<UserEntity> signInWithEmailAndPassword(AuthEntity auth) async {
    late UserEntity res;
    try{
      if(auth.email == user[0].email){
        res = user[0];
      }
    }catch(e){
      res = UserEntity(email: '', name: '', uid: '');
    }

    return res;
  }

  Future<bool> isEmailAlreadyExists(String email) async {
    bool res = false;
    for(var i in user){
      if(i.email == email){
        res = true;
      }
    }
    return res;
  }

  Future<UserEntity> getUser() async {
    return user[0];
  }

  Future<void> forgotPassword(String email) async {
    //send email
    await Future.delayed(Duration(seconds: 3),() {});
  }

  Future<bool> isAuthenticated() async {
    bool res = false;
    try{
      if(user[0].email.isNotEmpty){
        res = true;
      }
    // ignore: empty_catches
    }catch(e){}
    
    return res;
  }

  Future<void> logout() async {
    // ignore: null_check_always_fails
    user = [];
  }
  
}