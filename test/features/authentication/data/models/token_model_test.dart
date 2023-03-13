import 'dart:convert';

import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/refresh_token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return map token access', () async {
    var refresh_token = TokenRefreshModel(
        id: 3, token: "5915c1b8-08d0-4e27-a877-8d3c059cdc26", expires_in: "1679769985941", timestamp: "2023-02-25T21:39:59.820Z", user_id: 3);
    String access_token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJ1aWQiOiIzYjRjZWJhYS1jYjc1LTRjNzAtOGUyYS1lNzdlOTU1NzEwZTUiLCJlbWFpbCI6IjIwMzMueHl6QGdtYWlsLmNvbSIsIm5hbWUiOiJzYXVsbyIsInByb3ZpZGVycyI6ImxvY2FsLmNvbSIsImxhc3RfbG9naW4iOiIyMDIzLTAyLTI1VDE4OjM5OjU5LjY1NloiLCJpc19hY3RpdmUiOmZhbHNlLCJ1cGRhdGVkX2F0IjpudWxsLCJ0aW1lc3RhbXAiOiIyMDIzLTAyLTIzVDE4OjAwOjM0LjEzOVoiLCJyb2xlIjoidXNlciJ9LCJpYXQiOjE2NzczNTA3ODYsImV4cCI6MTY3NzUzMDc4Nn0.Jy9s-jcgk0cV9SWZwmpQx_IC5j7wggfQU3p4PK7nxj8';

    var token_model = TokenAccessModel(access_token: access_token, refresh_token: refresh_token);

    Map<dynamic, dynamic> res = token_model.toMap();
    final tokenObject = jsonEncode(res);
    String tokenText = tokenObject.toString();
    Iterable l = [jsonDecode(tokenText)];
    List<TokenAccessModel> token = List<TokenAccessModel>.from(l.map((model) => TokenAccessModel.fromMap(model)));
    print(token[0].access_token);
    //then
    expect(token[0].access_token, access_token);
  });
}
