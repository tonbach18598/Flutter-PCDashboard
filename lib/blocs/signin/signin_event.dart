import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable{
  const SigninEvent();
}

class ClickForgetButtonEvent extends SigninEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ClickSigninButtonEvent extends SigninEvent{
  String username;
  String password;

  ClickSigninButtonEvent(this.username,this.password);

  @override
  // TODO: implement props
  List<Object> get props => [];
}