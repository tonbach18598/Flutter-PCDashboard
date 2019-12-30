import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable{
  const SigninEvent();
}

class PressForgetEvent extends SigninEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressSigninEvent extends SigninEvent{
  String username;
  String password;

  PressSigninEvent(this.username,this.password);

  @override
  // TODO: implement props
  List<Object> get props => null;
}