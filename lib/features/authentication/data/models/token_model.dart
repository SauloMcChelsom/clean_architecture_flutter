import 'package:clean_architecture_flutter/features/authentication/data/models/refresh_token_model.dart';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  final String access_token;
  final TokenRefreshTokenModel refresh_token;

  TokenModel({required this.access_token, required this.refresh_token}) : super(access_token: access_token, refresh_token: refresh_token);

  Map toMap() {
    return {'access_token': this.access_token, 'refresh_token': this.refresh_token};
  }

  static TokenModel fromMap(Map map) {
    return TokenModel(access_token: map['access_token'], refresh_token: map['refresh_token']);
  }
}
