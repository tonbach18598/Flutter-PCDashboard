import 'package:equatable/equatable.dart';


abstract class FeedbackEvent extends Equatable{
  const FeedbackEvent();
}

class ClickSendEvent extends FeedbackEvent{
  String content;

  ClickSendEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}