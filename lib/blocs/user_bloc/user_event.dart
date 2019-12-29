import 'package:equatable/equatable.dart';


abstract class UserEvent extends Equatable{
  const UserEvent();
}

class ClickUserEvent extends UserEvent{

  ClickUserEvent();

  @override
  // TODO: implement props
  List<Object> get props => null;
}