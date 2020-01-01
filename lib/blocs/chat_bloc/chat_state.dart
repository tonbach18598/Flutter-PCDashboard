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

class ConnectSocketState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessFetchListState extends ChatState{
  List<ChatResponse> messages;


  SuccessFetchListState(this.messages);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class FailureFetchListState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressSendState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressSendState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressSendState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}