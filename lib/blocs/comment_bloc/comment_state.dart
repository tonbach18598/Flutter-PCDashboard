import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/comment_response.dart';

abstract class CommentState extends Equatable{
  const CommentState();
}

class InitialCommentState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadingState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessFetchListState extends CommentState{
  List<CommentResponse> comments;

  SuccessFetchListState(this.comments);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureFetchListState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessPressSendState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressSendState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressSendState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressEditState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressDeleteState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}