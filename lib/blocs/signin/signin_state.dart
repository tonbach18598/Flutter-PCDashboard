import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable{
  const SigninState();
}

class InitialSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickForgetButtonState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningSigninState extends SigninState{

  @override
  // TODO: implement props
  List<Object> get props => null;
}