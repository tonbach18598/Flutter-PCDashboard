import 'package:equatable/equatable.dart';


abstract class CommentEvent extends Equatable{
  const CommentEvent();
}

class PressSendEvent extends CommentEvent{
  String content;

  PressSendEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}