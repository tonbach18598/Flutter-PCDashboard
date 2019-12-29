import 'package:equatable/equatable.dart';

abstract class CommentState extends Equatable{
  const CommentState();
}

class InitialCommentState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessSendState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureSendState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningSendState extends CommentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}