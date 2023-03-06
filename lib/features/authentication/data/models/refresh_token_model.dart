import 'package:clean_architecture_flutter/features/authentication/domain/entities/token_entity.dart';

class TokenRefreshModel extends TokenRefreshTokenEntity {
  int id;
  String token;
  String expires_in;
  String timestamp;
  int user_id;

  TokenRefreshModel({required this.id, required this.token, required this.expires_in, required this.timestamp, required this.user_id})
      : super(id: id, token: token, expires_in: expires_in, timestamp: timestamp, user_id: user_id);

  Map toMap() {
    return {'id': this.id, 'token': this.token, 'expires_in': this.expires_in, 'timestamp': this.timestamp, 'user_id': this.user_id};
  }

  static TokenRefreshModel fromMap(Map map) {
    return TokenRefreshModel(id: map['id'], token: map['token'], expires_in: map['expires_in'], timestamp: map['timestamp'], user_id: map['user_id']);
  }
}
