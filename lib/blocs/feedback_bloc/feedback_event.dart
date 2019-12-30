import 'package:equatable/equatable.dart';


abstract class FeedbackEvent extends Equatable{
  const FeedbackEvent();
}

class PressSendEvent extends FeedbackEvent{
  String content;

  PressSendEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}