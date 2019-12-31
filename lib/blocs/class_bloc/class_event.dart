import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';

abstract class ClassEvent extends Equatable {
  const ClassEvent();
}

class InitializeSelfEvent extends ClassEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FetchListEvent extends ClassEvent {
  int number;

  FetchListEvent(this.number);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapPostEvent extends ClassEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapCommentEvent extends ClassEvent {
  ClassResponse post;

  TapCommentEvent(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressMoreEvent extends ClassEvent {
  ClassResponse post;

  PressMoreEvent(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressEditEvent extends ClassEvent {
  ClassResponse post;

  PressEditEvent(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressDeleteEvent extends ClassEvent {
  ClassResponse post;

  PressDeleteEvent(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressCancelEvent extends ClassEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

