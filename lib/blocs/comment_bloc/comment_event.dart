import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/comment_response.dart';


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
  String postId;
  String content;

  PressSendEvent(this.postId,this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressEditEvent extends CommentEvent{
  CommentResponse comment;

  PressEditEvent(this.comment);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressConfirmEvent extends CommentEvent{
  CommentResponse comment;
  String newContent;

  PressConfirmEvent(this.comment,this.newContent);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressCancelEvent extends CommentEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressDeleteEvent extends CommentEvent{
CommentResponse comment;

PressDeleteEvent(this.comment);

@override
  // TODO: implement props
  List<Object> get props => null;
}