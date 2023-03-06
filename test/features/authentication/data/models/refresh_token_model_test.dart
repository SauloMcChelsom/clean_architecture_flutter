import 'dart:convert';

import 'package:clean_architecture_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:clean_architecture_flutter/features/authentication/data/models/refresh_token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/data/repositories/authentication_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return map token refresh', () async {
    var refresh_token = TokenRefreshModel(
        id: 3, token: "5915c1b8-08d0-4e27-a877-8d3c059cdc26", expires_in: "1679769985941", timestamp: "2023-02-25T21:39:59.820Z", user_id: 3);

    Map<dynamic, dynamic> res = refresh_token.toMap();
    final tokenObject = jsonEncode(res);

    String tokenText = tokenObject.toString();

    Iterable l = [jsonDecode(tokenText)];

    List<TokenRefreshModel> token = List<TokenRefreshModel>.from(l.map((model) => TokenRefreshModel.fromMap(model)));

    //then
    expect(token[0].token, refresh_token.token);
  });
}
