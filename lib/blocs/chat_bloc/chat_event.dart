import 'package:equatable/equatable.dart';


abstract class ChatEvent extends Equatable{
  const ChatEvent();
}

class ConnectSocketEvent extends ChatEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class DisConnectSocketEvent extends ChatEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}


class FetchListEvent extends ChatEvent{

  int number;
  bool scroll;

  FetchListEvent(this.number,this.scroll);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressSendEvent extends ChatEvent{
  String content;

  PressSendEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}