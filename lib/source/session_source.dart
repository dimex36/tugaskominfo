import 'package:shared_preferences/shared_preferences.dart';

class SessionSource {
  final _token = '_token';

  Future<void> saveToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
  }

  Future<String?> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

    Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
  }
}
