import 'package:equatable/equatable.dart';


abstract class ChatEvent extends Equatable{
  const ChatEvent();
}

class PressSendEvent extends ChatEvent{
  String content;

  PressSendEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}