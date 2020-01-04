import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';

abstract class EditState extends Equatable{
  const EditState();
}

class InitialEditState extends EditState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadingState extends EditState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class InitializeSelfState extends EditState{
  SelfResponse self;

  InitializeSelfState(this.self);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressEditState extends EditState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressEditState extends EditState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressEditState extends EditState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}