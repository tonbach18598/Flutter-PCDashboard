import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/user_response.dart';


abstract class UserEvent extends Equatable{
  const UserEvent();
}

class FetchListEvent extends UserEvent{
String classId;

FetchListEvent(this.classId);

@override
  // TODO: implement props
  List<Object> get props => null;
}

class TapUserEvent extends UserEvent{
UserResponse user;

TapUserEvent(this.user);

@override
  // TODO: implement props
  List<Object> get props => null;
}