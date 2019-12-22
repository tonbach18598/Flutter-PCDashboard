import 'dart:async';

class SigninStream{
  StreamController _usernameController=StreamController.broadcast();
  StreamController _passwordController=StreamController.broadcast();
  
  Stream get usernameStream=>_usernameController.stream;
  Stream get passwordStream=>_passwordController.stream;

  bool isValid(String username,String password){
    if(username.isEmpty){
      _usernameController.sink.addError("Tài khoản không được để trống");
      return false;
    }else if(password.isEmpty){
      _passwordController.sink.addError("Mật khẩu không được để trống");
      return false;
    }else{
      return true;
    }
  }

  void dispose(){
    _usernameController.close();
    _passwordController.close();
  }
}