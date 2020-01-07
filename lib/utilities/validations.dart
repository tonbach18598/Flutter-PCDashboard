import 'dart:io';
import 'package:flutter_pcdashboard/utilities/configs.dart';

class Validations{

  static bool isValidPassword(String password){
    return password.length>=6?true:false;
  }

  static bool isValidEmail(String email) {
    RegExp reg = new RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return reg.hasMatch(email);
  }
  
  static bool isValidPhone(String phone) {
    RegExp regExp = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return regExp.hasMatch(phone);
  }

  static Future<bool> isConnectedNetwork() async {
    try {
      final result = await InternetAddress.lookup(Configs.baseUrl)
          .timeout(const Duration(seconds: 20));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static bool isUrl(String string) {
    RegExp reg = new RegExp(
        r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?",
        caseSensitive: false);
    if (reg.hasMatch(string)) {
      return true;
    }
    return false;
  }
}