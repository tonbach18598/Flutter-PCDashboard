import 'package:equatable/equatable.dart';


abstract class PostEvent extends Equatable{
  const PostEvent();
}

class PressPostEvent extends PostEvent{
  String content;

  PressPostEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}