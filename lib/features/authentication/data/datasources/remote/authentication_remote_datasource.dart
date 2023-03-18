import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/core/services/http/http_service.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/authentication_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/response_dto.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/token_dto.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';

class AuthenticationRemoteDatasource implements IAuthenticationDatasource {
  final IHttpService http;
  AuthenticationRemoteDatasource(this.http);

  List<UserEntity> user = [];
  List<TokenModel> token = [];
  String access_token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJ1aWQiOiIzYjRjZWJhYS1jYjc1LTRjNzAtOGUyYS1lNzdlOTU1NzEwZTUiLCJlbWFpbCI6IjIwMzMueHl6QGdtYWlsLmNvbSIsIm5hbWUiOiJzYXVsbyIsInByb3ZpZGVycyI6ImxvY2FsLmNvbSIsImxhc3RfbG9naW4iOiIyMDIzLTAyLTI1VDE4OjM5OjU5LjY1NloiLCJpc19hY3RpdmUiOmZhbHNlLCJ1cGRhdGVkX2F0IjpudWxsLCJ0aW1lc3RhbXAiOiIyMDIzLTAyLTIzVDE4OjAwOjM0LjEzOVoiLCJyb2xlIjoidXNlciJ9LCJpYXQiOjE2NzczNTA3ODYsImV4cCI6MTY3NzUzMDc4Nn0.Jy9s-jcgk0cV9SWZwmpQx_IC5j7wggfQU3p4PK7nxj8';

  Future<ResponseEntity> register({required String firstName, required String lastName, required String email, required String password}) async {
    late ResponseEntity res;
    try {
      var user_entity = UserEntity(
          email: email, password: password, name: '$firstName $lastName', providers: 'local.com', id: 3, uid: '3b4cebaa-cb75-4c70-8e2a-e77e955710e5');
      if (user_entity.passwordMinLength() == false) {
        res = ResponseEntity(
            statusCode: 400,
            message: 'password should be at least 8 characters',
            code: 'FAILED',
            description: '',
            results: user,
            timestamp: DateTime.now().toString());
        return res;
      }
      if (user_entity.passwordMaxLength() == false) {
        res = ResponseEntity(
            statusCode: 400,
            message: 'password should be at max 12 characters',
            code: 'FAILED',
            description: '',
            results: user,
            timestamp: DateTime.now().toString());
        return res;
      }
      if (user.isNotEmpty) {
        if (user[0].email == email) {
          res = ResponseEntity(
              statusCode: 400, message: 'email already in use', code: 'FAILED', description: '', results: user, timestamp: DateTime.now().toString());
          return res;
        }
      }
      user.add(user_entity);
      if (user[0].email.isNotEmpty) {
        res = ResponseEntity(
            statusCode: 200, message: 'successful register', code: 'SUCCESS', description: '', results: user, timestamp: DateTime.now().toString());
        return res;
      }
      res = ResponseEntity(
          statusCode: 400,
          message: 'it was not possible to register the user',
          code: 'FAILED',
          description: '',
          results: user,
          timestamp: DateTime.now().toString());
      return res;
    } catch (e) {
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
      var user_entity = UserEntity(email: username, password: password, name: '', providers: '', id: 0, uid: '0');
      if (user_entity.passwordMinLength() == false) {
        res = ResponseEntity(
            statusCode: 400,
            message: 'password should be at least 8 characters',
            code: 'FAILED',
            description: '',
            results: user,
            timestamp: DateTime.now().toString());
        return res;
      }
      if (user_entity.passwordMaxLength() == false) {
        res = ResponseEntity(
            statusCode: 400,
            message: 'password should be at max 12 characters',
            code: 'FAILED',
            description: '',
            results: user,
            timestamp: DateTime.now().toString());
        return res;
      }

      var data = '{"email": "$username", "password": "$password"}';
      ResponseEntity response = await http.post('http://localhost:3000/v1/public/auth/sign-in', data: data);

      if (response.getStatusCode() == 201) {
        String token_text = response.getResults().toString();
        var tokenObject = TokenDTO(token: token_text);
        var tokens = tokenObject.token();
        res = ResponseEntity(
            statusCode: 200,
            message: 'successful authentication',
            code: 'SUCCESS',
            description: '',
            results: [tokens],
            timestamp: DateTime.now().toString());
        return res;
      }

      var response_dto = ResponseDTO(response_text: response.getResults().toString());
      var response_entity = ResponseEntity(results: []);
      response_entity = response_dto.response();

      if (response_entity.getMessage() == 'Different password') {
        res = ResponseEntity(
            statusCode: 400,
            message: 'password does not match',
            code: 'FAILED',
            description: 'logging failed',
            results: [],
            timestamp: DateTime.now().toString());
        return res;
      }
      if (response_entity.getMessage() == 'not found user by email') {
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
      if (user.isNotEmpty) {
        return ResponseEntity(
            statusCode: 200, message: 'user found', code: 'SUCCESS', description: '', results: user, timestamp: DateTime.now().toString());
      }
      return ResponseEntity(
          statusCode: 400, message: 'user not found', code: 'FAILED', description: '', results: [], timestamp: DateTime.now().toString());
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
      if (user.isNotEmpty) {
        return ResponseEntity(
            statusCode: 200, message: 'user authenticated', code: 'SUCCESS', description: '', results: token, timestamp: DateTime.now().toString());
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
      token = [];
      access_token = '';
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
