import 'package:flutter_pcdashboard/models/responses/token_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  static void saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }

  static Future<String> loadToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token');
    return token;
  }
  static void clearAll() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.clear();
  }
}
