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

class InitializeSelfState extends DashboardState{
  SelfResponse self;
  InitializeSelfState(this.self);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapSelfDetailsState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapHomeState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapUpdateInformationState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapChangePasswordState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapDeveloperState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapSignoutState extends DashboardState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}