import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable{
  const SigninState();
}

class InitialSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class ClickForgetPasswordState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class ClickSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class ErrorState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}