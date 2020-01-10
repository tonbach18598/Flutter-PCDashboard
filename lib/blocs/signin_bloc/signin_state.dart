import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable{
  const SigninState();
}

class InitialSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadingState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressForgetState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessPressSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressSigninState extends SigninState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressSigninState extends SigninState{

  @override
  // TODO: implement props
  List<Object> get props => null;
}