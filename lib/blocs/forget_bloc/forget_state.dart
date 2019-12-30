import 'package:equatable/equatable.dart';

abstract class ForgetState extends Equatable{
  const ForgetState();
}

class InitialForgetState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class PressBackState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}

class SuccessGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}