import 'package:equatable/equatable.dart';

abstract class ForgetState extends Equatable{
  const ForgetState();
}

class InitialForgetState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class ClickBackState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class ClickGetPasswordState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class ErrorState extends ForgetState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}