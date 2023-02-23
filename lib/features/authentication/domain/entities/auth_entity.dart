class AuthEntity {
  final String email;
  final String password;
  
  AuthEntity({
    required this.email, 
    required this.password
  });

  bool passwordMinLength(){
    if(password.length == 8){
      return true;
    }else{
      return false;
    }
  }
}