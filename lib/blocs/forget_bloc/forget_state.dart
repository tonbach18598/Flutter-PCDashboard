import 'package:equatable/equatable.dart';

abstract class ForgetState extends Equatable{
  const ForgetState();
}

class InitialForgetState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadingState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressBackState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}

class SuccessPressGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}