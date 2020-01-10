import 'package:equatable/equatable.dart';

abstract class DeveloperState extends Equatable{
  const DeveloperState();
}

class InitialDeveloperState extends DeveloperState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressSendState extends DeveloperState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressSendState extends DeveloperState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressSendState extends DeveloperState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}