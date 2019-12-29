import 'package:equatable/equatable.dart';


abstract class ClassEvent extends Equatable{
  const ClassEvent();
}

class ClickPostEvent extends ClassEvent{

  ClickPostEvent();

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickCommentEvent extends ClassEvent{

  ClickCommentEvent();

  @override
  // TODO: implement props
  List<Object> get props => null;
}