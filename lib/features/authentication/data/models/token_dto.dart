import 'dart:convert';

import 'package:clean_architecture_flutter/features/authentication/data/models/refresh_token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/token_entity.dart';

class TokenDTO {
  String token;
  TokenRefreshModel _refresh_token = TokenRefreshModel(id: 0, user_id: 0, token: '', expires_in: '', timestamp: '');
  String _access_token = '';

  TokenDTO({required this.token});

  TokenModel toMap() {
    var json = jsonDecode(token);
    setAccessToken(json[0]['access_token']);

    setRefreshToken(
        id: json[0]['refresh_token']['id'],
        user_id: json[0]['refresh_token']['user_id'],
        token: json[0]['refresh_token']['token'],
        expires_in: json[0]['refresh_token']['expires_in'],
        timestamp: json[0]['refresh_token']['timestamp']);
    return TokenModel(access_token: this._access_token, refresh_token: this._refresh_token);
  }

  setAccessToken(String value) {
    this._access_token = value;
  }

  setRefreshToken({required int id, required int user_id, required String token, required String expires_in, required String timestamp}) {
    this._refresh_token = TokenRefreshModel(id: id, user_id: user_id, token: token, expires_in: expires_in, timestamp: timestamp);
  }
}

void main(List<String> args) {
  String token_text =
      '[{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJ1aWQiOiIzYjRjZWJhYS1jYjc1LTRjNzAtOGUyYS1lNzdlOTU1NzEwZTUiLCJlbWFpbCI6IjIwMzMueHl6QGdtYWlsLmNvbSIsIm5hbWUiOiJzYXVsbyIsInByb3ZpZGVycyI6ImxvY2FsLmNvbSIsImxhc3RfbG9naW4iOiIyMDIzLTAzLTEzVDE0OjMyOjI3LjIyOVoiLCJpc19hY3RpdmUiOmZhbHNlLCJ1cGRhdGVkX2F0IjpudWxsLCJ0aW1lc3RhbXAiOiIyMDIzLTAyLTIzVDE4OjAwOjM0LjEzOVoiLCJyb2xlIjoidXNlciJ9LCJpYXQiOjE2Nzg3MTk1NzUsImV4cCI6MTY3ODg5OTU3NX0.vHJZ4vGz_L_2EBgE-ex6l-lIE9oOFUgy_HCl3G0t1Ug","refresh_token":{"id":3,"token":"5915c1b8-08d0-4e27-a877-8d3c059cdc26","expires_in":"1679769985941","timestamp":"2023-02-25T21:39:59.820Z","user_id":3}}]';
  final token = TokenDTO(token: token_text);
  var obj = token.toMap();
  print(obj.access_token);
  print(obj.refresh_token.toMap());
}
/**
  [{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJ1aWQiOiIzYjRjZWJhYS1jYjc1LTRjNzAtOGUyYS1lNzdlOTU1NzEwZTUiLCJlbWFpbCI6IjIwMzMueHl6QGdtYWlsLmNvbSIsIm5hbWUiOiJzYXVsbyIsInByb3ZpZGVycyI6ImxvY2FsLmNvbSIsImxhc3RfbG9naW4iOiIyMDIzLTAzLTEzVDE0OjMyOjI3LjIyOVoiLCJpc19hY3RpdmUiOmZhbHNlLCJ1cGRhdGVkX2F0IjpudWxsLCJ0aW1lc3RhbXAiOiIyMDIzLTAyLTIzVDE4OjAwOjM0LjEzOVoiLCJyb2xlIjoidXNlciJ9LCJpYXQiOjE2Nzg3MTk1NzUsImV4cCI6MTY3ODg5OTU3NX0.vHJZ4vGz_L_2EBgE-ex6l-lIE9oOFUgy_HCl3G0t1Ug",
  "refresh_token":{
  "id":3,
  "token":"5915c1b8-08d0-4e27-a877-8d3c059cdc26",
  "expires_in":"1679769985941",
  "timestamp":"2023-02-25T21:39:59.820Z",
  "user_id":3}}]
 */