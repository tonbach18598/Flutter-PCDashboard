import 'package:equatable/equatable.dart';


abstract class ForgetEvent extends Equatable{
  const ForgetEvent();
}

class ClickBackButtonEvent extends ForgetEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ClickGetPasswordButtonEvent extends ForgetEvent{
  String username;

  ClickGetPasswordButtonEvent(this.username);

  @override
  // TODO: implement props
  List<Object> get props => [];
}