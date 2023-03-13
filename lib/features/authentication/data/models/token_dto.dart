import 'package:clean_architecture_flutter/features/authentication/data/models/refresh_token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/token_entity.dart';

class TokenDTO {
  final String token;
  final TokenRefreshModel _refresh_token = TokenRefreshModel(id: 0, user_id: 0, token: '', expires_in: '', timestamp: '');
  final TokenAccessModel _access_token =
      TokenAccessModel(access_token: '', refresh_token: TokenRefreshModel(id: 0, user_id: 0, token: '', expires_in: '', timestamp: ''));

  TokenDTO({required this.token});

  Map toMap() {
    return {'access_token': this._access_token, 'refresh_token': this._refresh_token.toMap()};
  }
}
/**
 * [{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJ1aWQiOiIzYjRjZWJhYS1jYjc1LTRjNzAtOGUyYS1lNzdlOTU1NzEwZTUiLCJlbWFpbCI6IjIwMzMueHl6QGdtYWlsLmNvbSIsIm5hbWUiOiJzYXVsbyIsInByb3ZpZGVycyI6ImxvY2FsLmNvbSIsImxhc3RfbG9naW4iOiIyMDIzLTAzLTEzVDE0OjMyOjI3LjIyOVoiLCJpc19hY3RpdmUiOmZhbHNlLCJ1cGRhdGVkX2F0IjpudWxsLCJ0aW1lc3RhbXAiOiIyMDIzLTAyLTIzVDE4OjAwOjM0LjEzOVoiLCJyb2xlIjoidXNlciJ9LCJpYXQiOjE2Nzg3MTk1NzUsImV4cCI6MTY3ODg5OTU3NX0.vHJZ4vGz_L_2EBgE-ex6l-lIE9oOFUgy_HCl3G0t1Ug",
 * "refresh_token":{
 * "id":3,
 * "token":"5915c1b8-08d0-4e27-a877-8d3c059cdc26",
 * "expires_in":"1679769985941",
 * "timestamp":"2023-02-25T21:39:59.820Z",
 * "user_id":3}}]
 */