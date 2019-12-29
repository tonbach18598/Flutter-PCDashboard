import 'package:equatable/equatable.dart';


abstract class ChatEvent extends Equatable{
  const ChatEvent();
}

class ClickSendEvent extends ChatEvent{
  String content;

  ClickSendEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}