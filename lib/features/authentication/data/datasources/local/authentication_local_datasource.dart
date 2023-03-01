import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/refresh_token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';

const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJ1aWQiOiIzYjRjZWJhYS1jYjc1LTRjNzAtOGUyYS1lNzdlOTU1NzEwZTUiLCJlbWFpbCI6IjIwMzMueHl6QGdtYWlsLmNvbSIsIm5hbWUiOiJzYXVsbyIsInByb3ZpZGVycyI6ImxvY2FsLmNvbSIsImxhc3RfbG9naW4iOiIyMDIzLTAyLTI1VDE4OjM5OjU5LjY1NloiLCJpc19hY3RpdmUiOmZhbHNlLCJ1cGRhdGVkX2F0IjpudWxsLCJ0aW1lc3RhbXAiOiIyMDIzLTAyLTIzVDE4OjAwOjM0LjEzOVoiLCJyb2xlIjoidXNlciJ9LCJpYXQiOjE2NzczNTA3ODYsImV4cCI6MTY3NzUzMDc4Nn0.Jy9s-jcgk0cV9SWZwmpQx_IC5j7wggfQU3p4PK7nxj8';

class AuthenticationLocalDatasource {
  List<UserEntity> user = [];

  Future<ResponseEntity> register({required String firstName, required String lastName, required String email, required String password}) async {
    user.add(UserEntity(
        email: email, password: password, name: '$firstName $lastName', providers: 'local.com', id: 3, uid: '3b4cebaa-cb75-4c70-8e2a-e77e955710e5'));
    late ResponseEntity res;
    try {} catch (e) {
      res = ResponseEntity(
          statusCode: 500,
          message: 'erro in register user',
          code: 'EXCEPTION',
          description: e.toString(),
          results: [],
          timestamp: DateTime.now().toString());
    }
    return res;
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

  Future<ResponseEntity> isEmailAlreadyExists(String email) async {
    late ResponseEntity res;
    try {
      for (var item in user) {
        if (item.email == email) {
          return ResponseEntity(
              statusCode: 200, message: 'email found', code: 'SUCCESS', description: '', results: [], timestamp: DateTime.now().toString());
        }
      }
      return ResponseEntity(
          statusCode: 400, message: 'email not found', code: 'FAILED', description: '', results: [], timestamp: DateTime.now().toString());
    } catch (e) {
      res = ResponseEntity(
          statusCode: 500,
          message: 'error find email',
          code: 'EXCEPTION',
          description: e.toString(),
          results: [],
          timestamp: DateTime.now().toString());
    }
    return res;
  }

  Future<ResponseEntity> getUser() async {
    late ResponseEntity res;
    try {
      if (user[0].email.isNotEmpty) {
        return ResponseEntity(
            statusCode: 200, message: 'email found', code: 'SUCCESS', description: '', results: user, timestamp: DateTime.now().toString());
      }
      return ResponseEntity(
          statusCode: 400, message: 'email not found', code: 'FAILED', description: '', results: [], timestamp: DateTime.now().toString());
    } catch (e) {
      res = ResponseEntity(
          statusCode: 500,
          message: 'error get user',
          code: 'EXCEPTION',
          description: e.toString(),
          results: [],
          timestamp: DateTime.now().toString());
    }
    return res;
  }

  Future<ResponseEntity> forgotPassword(String email) async {
    late ResponseEntity res;
    try {
      await Future.delayed(Duration(seconds: 3), () {});
      return ResponseEntity(
          statusCode: 200, message: 'email send with success', code: 'SUCCESS', description: '', results: user, timestamp: DateTime.now().toString());
    } catch (e) {
      res = ResponseEntity(
          statusCode: 500,
          message: 'error in send email',
          code: 'EXCEPTION',
          description: e.toString(),
          results: [],
          timestamp: DateTime.now().toString());
    }
    return res;
  }

  Future<ResponseEntity> isAuthenticated() async {
    late ResponseEntity res;
    try {
      if (user[0].email.isNotEmpty) {
        return ResponseEntity(
            statusCode: 200, message: 'user authenticated', code: 'SUCCESS', description: '', results: [true], timestamp: DateTime.now().toString());
      }
      return ResponseEntity(
          statusCode: 400, message: 'user not authenticated', code: 'FAILED', description: '', results: [], timestamp: DateTime.now().toString());
    } catch (e) {
      res = ResponseEntity(
          statusCode: 500,
          message: 'error in get user authenticated',
          code: 'EXCEPTION',
          description: e.toString(),
          results: [],
          timestamp: DateTime.now().toString());
    }
    return res;
  }

  Future<ResponseEntity> logout() async {
    late ResponseEntity res;
    try {
      user = [];
      return ResponseEntity(
          statusCode: 200, message: 'user logout with success', code: 'SUCCESS', description: '', results: [], timestamp: DateTime.now().toString());
    } catch (e) {
      res = ResponseEntity(
          statusCode: 500,
          message: 'error in logout user',
          code: 'EXCEPTION',
          description: e.toString(),
          results: [],
          timestamp: DateTime.now().toString());
    }
    return res;
  }
}
