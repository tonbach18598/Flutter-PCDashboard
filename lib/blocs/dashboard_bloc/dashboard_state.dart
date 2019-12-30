import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';

abstract class DashboardState extends Equatable{
  const DashboardState();
}

class InitialDashboardState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class InitSelfState extends DashboardState{
  SelfResponse self;
  InitSelfState(this.self);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapSelfDetailsState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapHomeState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapUpdateInformationState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapChangePasswordState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapFeedbackState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapSignoutState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}