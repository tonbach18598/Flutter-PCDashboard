import 'package:equatable/equatable.dart';

abstract class FeedbackState extends Equatable{
  const FeedbackState();
}

class InitialFeedbackState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressSendState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressSendState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressSendState extends FeedbackState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}