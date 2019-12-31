import 'package:equatable/equatable.dart';

abstract class ChangeState extends Equatable{
  const ChangeState();
}

class InitialChangeState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadingState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressConfirmState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressConfirmState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningEmptyPressConfirmState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPasswordPressConfirmState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningMatchPressConfirmState extends ChangeState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}