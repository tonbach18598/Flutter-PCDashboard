import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable{
  const SigninEvent();
}

class ClickForgetEvent extends SigninEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickSigninEvent extends SigninEvent{
  String username;
  String password;

  ClickSigninEvent(this.username,this.password);

  @override
  // TODO: implement props
  List<Object> get props => null;
}