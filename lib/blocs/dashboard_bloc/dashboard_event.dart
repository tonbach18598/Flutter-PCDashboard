import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable{
  const DashboardEvent();
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

class TapFeedbackEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapSignoutEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}