import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable{
  const SigninEvent();
}

class ClickForgetPasswordEvent extends SigninEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
  @override
  String toString() => "ClickForgetPasswordEvent";
}

class ClickSigninEvent extends SigninEvent{
  String username;
  String password;

  ClickSigninEvent(this.username,this.password);

  @override
  // TODO: implement props
  List<Object> get props => [];
  @override
  String toString() => "ClickSigninEvent";
}