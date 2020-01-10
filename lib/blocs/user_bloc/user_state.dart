import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/user_response.dart';

abstract class UserState extends Equatable{
  const UserState();
}

class InitialUserState extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadingState extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessFetchListState extends UserState{
  List<UserResponse> users;

  SuccessFetchListState(this.users);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class FailureFetchListState extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class TapUserState extends UserState{
  UserResponse user;

  TapUserState(this.user);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureTapEmailState extends UserState{

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class FailureTapPhoneState extends UserState{

  @override
  // TODO: implement props
  List<Object> get props => null;

}