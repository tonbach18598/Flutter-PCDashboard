import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable{
  const UserState();
}

class InitialUserState extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class ClickUserItemState extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}