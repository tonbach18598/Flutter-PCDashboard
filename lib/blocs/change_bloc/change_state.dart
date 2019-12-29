import 'package:equatable/equatable.dart';

abstract class ChangeState extends Equatable{
  const ChangeState();
}

class InitialChangeState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessChangePasswordState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureChangePasswordState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningChangePasswordState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}