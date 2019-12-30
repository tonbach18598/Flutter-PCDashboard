import 'package:equatable/equatable.dart';


abstract class ClassEvent extends Equatable{
  const ClassEvent();
}

class FetchListEvent extends ClassEvent{
  int number;
  FetchListEvent(this.number);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapPostEvent extends ClassEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapCommentEvent extends ClassEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressMoreEvent extends ClassEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressCancelEvent extends ClassEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

