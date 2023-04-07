import 'dart:convert';

import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:clean_architecture_flutter/features/authentication/data/datasources/authentication_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/refresh_token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';

class AuthenticationLocalDatasource implements IAuthenticationDatasource {
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

      if (this.user.length >= 1) {
        if (this.user[0].email == email) {
          res = ResponseEntity(
              statusCode: 200, message: 'email already exist', code: 'FAILED', description: '', results: [], timestamp: DateTime.now().toString());
          return res;
        } else {
          res = ResponseEntity(
              statusCode: 200, message: 'email already exist', code: 'FAILED', description: '', results: [], timestamp: DateTime.now().toString());
          return res;
        }
      }

      int getStatusCode = 201;
      String property = "";

      if (email.length == 0) {
        getStatusCode = 400;
        property = "email";
      }

      if (firstName.length == 0) {
        getStatusCode = 400;
        property = "name";
      }

      if (getStatusCode == 400 && property == "email") {
        res = ResponseEntity(
            statusCode: 200,
            message: 'email must be an email',
            code: 'SUCCESS',
            description: '',
            results: user,
            timestamp: DateTime.now().toString());
        return res;
      }

      if (getStatusCode == 400 && property == "name") {
        res = ResponseEntity(
            statusCode: 200,
            message: 'name must be longer than or equal to 2 characters',
            code: 'SUCCESS',
            description: '',
            results: user,
            timestamp: DateTime.now().toString());
        return res;
      }

      if (getStatusCode == 201) {
        user.add(UserEntity(
            email: user_entity.email,
            id: 125,
            is_active: false,
            last_login: '',
            name: user_entity.name,
            password: user_entity.password,
            providers: '',
            role: '',
            timestamp: '',
            uid: '',
            updated_at: ''));
        res = ResponseEntity(
            statusCode: 200, message: 'successful register', code: 'SUCCESS', description: '', results: user, timestamp: DateTime.now().toString());
        return res;
      }

      res = ResponseEntity(
          statusCode: 400,
          message: 'it was not possible to register the user',
          code: 'FAILED',
          description: "",
          results: [user_entity.toString()],
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
      if (username == user[0].email && password == user[0].password) {
        var refresh_token = TokenRefreshModel(
            id: 3, token: "5915c1b8-08d0-4e27-a877-8d3c059cdc26", expires_in: "1679769985941", timestamp: "2023-02-25T21:39:59.820Z", user_id: 3);
        var model = TokenModel(access_token: access_token, refresh_token: refresh_token);
        token.add(model);
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
      if (username != user[0].email) {
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
