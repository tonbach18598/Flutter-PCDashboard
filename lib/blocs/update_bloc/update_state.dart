import 'package:equatable/equatable.dart';

abstract class UpdateState extends Equatable{
  const UpdateState();
}

class InitialUpdateState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessUpdateInformationState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureUpdateInformationState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningUpdateInformationState extends UpdateState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}