import 'package:equatable/equatable.dart';

abstract class ForgetState extends Equatable{
  const ForgetState();
}

class InitialForgetState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class ClickBackButtonState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class SuccessGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FailureGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WarningGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}