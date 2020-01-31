import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/chat_response.dart';

abstract class ChatState extends Equatable{
  const ChatState();
}

class InitialChatState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadingState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessFetchListState extends ChatState{
  List<ChatResponse> messages;
  int number;
  bool scroll;

  SuccessFetchListState(this.messages,this.number,this.scroll);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class FailureFetchListState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}