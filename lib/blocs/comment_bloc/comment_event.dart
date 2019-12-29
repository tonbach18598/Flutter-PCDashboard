import 'package:equatable/equatable.dart';


abstract class CommentEvent extends Equatable{
  const CommentEvent();
}

class ClickSendEvent extends CommentEvent{
  String content;

  ClickSendEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}