import 'package:equatable/equatable.dart';


abstract class ForgetEvent extends Equatable{
  const ForgetEvent();
}

class PressBackEvent extends ForgetEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressGetPasswordEvent extends ForgetEvent{
  String username;

  PressGetPasswordEvent(this.username);

  @override
  // TODO: implement props
  List<Object> get props => null;
}