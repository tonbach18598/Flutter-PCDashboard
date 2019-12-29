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

class ClickPostEvent extends ClassEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ClickCommentEvent extends ClassEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

