import 'package:equatable/equatable.dart';


abstract class CommentEvent extends Equatable{
  const CommentEvent();
}

class FetchListEvent extends CommentEvent{
  String postId;


  FetchListEvent(this.postId);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressSendEvent extends CommentEvent{
  String content;

  PressSendEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}