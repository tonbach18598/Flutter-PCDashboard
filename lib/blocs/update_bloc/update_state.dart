import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';

abstract class UpdateState extends Equatable{
  const UpdateState();
}

class InitialUpdateState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadingState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class InitializeSelfState extends UpdateState{
  SelfResponse self;

  InitializeSelfState(this.self);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressConfirmState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressConfirmState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningEmptyPressConfirmState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningEmailPressConfirmState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPhonePressConfirmState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}