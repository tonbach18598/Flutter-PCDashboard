import 'dart:async';

class ForgetStream{
  StreamController _usernameController=StreamController.broadcast();
  
  Stream get usernameStream=>_usernameController.stream;

  bool isValid(String username,String password){
    if(username.isEmpty){
      _usernameController.addError("Tài khoản không được để trống");
      return false;
    }else{
      return true;
    }
  }

  void dispose(){
    _usernameController.close();
  }
}