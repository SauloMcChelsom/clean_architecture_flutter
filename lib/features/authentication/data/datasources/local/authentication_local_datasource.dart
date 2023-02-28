import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/refresh_token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';

const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJ1aWQiOiIzYjRjZWJhYS1jYjc1LTRjNzAtOGUyYS1lNzdlOTU1NzEwZTUiLCJlbWFpbCI6IjIwMzMueHl6QGdtYWlsLmNvbSIsIm5hbWUiOiJzYXVsbyIsInByb3ZpZGVycyI6ImxvY2FsLmNvbSIsImxhc3RfbG9naW4iOiIyMDIzLTAyLTI1VDE4OjM5OjU5LjY1NloiLCJpc19hY3RpdmUiOmZhbHNlLCJ1cGRhdGVkX2F0IjpudWxsLCJ0aW1lc3RhbXAiOiIyMDIzLTAyLTIzVDE4OjAwOjM0LjEzOVoiLCJyb2xlIjoidXNlciJ9LCJpYXQiOjE2NzczNTA3ODYsImV4cCI6MTY3NzUzMDc4Nn0.Jy9s-jcgk0cV9SWZwmpQx_IC5j7wggfQU3p4PK7nxj8';

class AuthenticationLocalDatasource {
  List<UserEntity> user = [];

  Future<void> register({required String firstName, required String lastName, required String email, required String password}) async {
    user.add(UserEntity(
        email: email, password: password, name: '$firstName $lastName', providers: 'local.com', id: 3, uid: '3b4cebaa-cb75-4c70-8e2a-e77e955710e5'));
  }

  Future<ResponseEntity> signInWithEmailAndPassword({required String username, required String password}) async {
    late ResponseEntity res;
    try {
      if (username == user[0].email && password == user[0].password) {
        var refresh_token = TokenRefreshTokenModel(
            id: 3, token: "5915c1b8-08d0-4e27-a877-8d3c059cdc26", expires_in: "1679769985941", timestamp: "2023-02-25T21:39:59.820Z", user_id: 3);
        var model = TokenModel(access_token: token, refresh_token: refresh_token);
        res = ResponseEntity(
            statusCode: 200,
            message: 'successful authentication',
            code: 'SUCCESS',
            description: '',
            results: [model.toMap()],
            timestamp: DateTime.now().toString());
        return res;
      }
      if (username == user[0].email && password != user[0].password) {
        res = ResponseEntity(
            statusCode: 400,
            message: 'password does not match',
            code: 'FAILED',
            description: 'logging failed',
            results: [],
            timestamp: DateTime.now().toString());
        return res;
      }
      if (username != user[0].email && password != user[0].password) {
        res = ResponseEntity(
            statusCode: 400,
            message: 'user does not exist',
            code: 'FAILED',
            description: 'logging failed',
            results: [],
            timestamp: DateTime.now().toString());
        return res;
      }
    } catch (e) {
      res = ResponseEntity(
          statusCode: 500,
          message: 'erro in sign in with email and password',
          code: 'EXCEPTION',
          description: e.toString(),
          results: [],
          timestamp: DateTime.now().toString());
    }

    return res;
  }

  Future<bool> isEmailAlreadyExists(String email) async {
    bool res = false;
    for (var i in user) {
      if (i.email == email) {
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
    await Future.delayed(Duration(seconds: 3), () {});
  }

  Future<bool> isAuthenticated() async {
    bool res = false;
    try {
      if (user[0].email.isNotEmpty) {
        res = true;
      }
      // ignore: empty_catches
    } catch (e) {}

    return res;
  }

  Future<void> logout() async {
    user = [];
  }
}
