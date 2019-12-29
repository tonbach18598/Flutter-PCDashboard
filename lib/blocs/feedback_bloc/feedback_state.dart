import 'package:equatable/equatable.dart';

abstract class FeedbackState extends Equatable{
  const FeedbackState();
}

class InitialFeedbackState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessSendState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureSendState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningSendState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}