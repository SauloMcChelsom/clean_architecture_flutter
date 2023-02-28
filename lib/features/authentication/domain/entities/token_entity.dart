class TokenEntity {
  String access_token;
  TokenRefreshTokenEntity refresh_token;
  TokenEntity({required this.access_token, required this.refresh_token});
}

class TokenRefreshTokenEntity {
  int id;
  String token;
  String expires_in;
  String timestamp;
  int user_id;

  TokenRefreshTokenEntity({required this.id, required this.token, required this.expires_in, required this.timestamp, required this.user_id});
}
