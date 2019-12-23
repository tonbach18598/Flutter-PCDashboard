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

class WarningSigninState extends SigninState{

  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class SuccessSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class FailureSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}