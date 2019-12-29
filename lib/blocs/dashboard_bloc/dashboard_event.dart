import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable{
  const DashboardEvent();
}

class ClickSelfDetailsEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickHomeEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickUpdateInformationEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickChangePasswordEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickFeedbackEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickSignoutEvent extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}