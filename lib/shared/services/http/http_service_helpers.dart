import 'package:clean_architecture_flutter/shared/services/local_store/shared_preferences_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>> headers() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final SharedPreferencesUtil sharedPreferencesUtil = SharedPreferencesUtil(sharedPreferences: sharedPreferences);
  final token = sharedPreferencesUtil.getAccessToken();
  late Map<String, String> headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
  if (token.isNotEmpty && token.length >= 10) {
    headers = {"Content-Type": "application/json", "Authorization": "Bearer $token"};
  }
  return headers;
}
