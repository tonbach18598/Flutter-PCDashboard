import 'package:equatable/equatable.dart';


abstract class ForgetEvent extends Equatable{
  const ForgetEvent();
}

class ClickBackEvent extends ForgetEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
  @override
  String toString() => "ClickBackEvent";
}

class ClickGetPasswordEvent extends ForgetEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
  @override
  String toString() => "ClickGetPasswordEvent";
}