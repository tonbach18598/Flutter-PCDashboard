import 'package:equatable/equatable.dart';


abstract class ChatEvent extends Equatable{
  const ChatEvent();
}

class FetchListEvent extends ChatEvent{

  int number;
  bool scroll;

  FetchListEvent(this.number,this.scroll);

  @override
  // TODO: implement props
  List<Object> get props => null;
}