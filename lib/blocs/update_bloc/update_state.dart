import 'package:equatable/equatable.dart';

abstract class UpdateState extends Equatable{
  const UpdateState();
}

class InitialUpdateState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressUpdateInformationState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressUpdateInformationState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressUpdateInformationState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}