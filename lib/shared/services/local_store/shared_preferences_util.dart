import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  SharedPreferencesUtil({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @visibleForTesting
  static const String access_token = '__access_token_collection_key__';

  String getAccessToken() {
    return sharedPreferences.getString(access_token) ?? '';
  }

  Future<bool> setAccessToken(String count) async {
    return sharedPreferences.setString(access_token, count);
  }
}
