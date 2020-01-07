import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }

  static Future<String> loadToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token');
    return token;
  }
  static Future clearAll() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.clear();
  }

  static Future saveSelf(SelfResponse self) async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    preferences.setString('selfId', self.userId);
    preferences.setString('selfName', self.name);
    preferences.setString('selfAvatar', self.avatar);
    preferences.setString('selfClassId', self.classId);
    preferences.setString('selfEmail', self.email);
    preferences.setString('selfPhone', self.phone);
  }

  static Future<SelfResponse> loadSelf()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String selfId=preferences.getString('selfId');
    String selfName=preferences.getString('selfName');
    String selfAvatar=preferences.getString('selfAvatar');
    String selfClassId=preferences.getString('selfClassId');
    String selfEmail=preferences.getString('selfEmail');
    String selfPhone=preferences.getString('selfPhone');
    SelfResponse selfResponse=SelfResponse(userId: selfId,name: selfName,avatar: selfAvatar,classId: selfClassId,email: selfEmail,phone: selfPhone);
    return selfResponse;
  }
}
