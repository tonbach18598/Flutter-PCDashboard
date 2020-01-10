import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable{
  const DashboardEvent();
}

class InitializeSelfEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapSelfDetailsEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapHomeEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapUpdateInformationEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapChangePasswordEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapDeveloperEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapSignoutEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}