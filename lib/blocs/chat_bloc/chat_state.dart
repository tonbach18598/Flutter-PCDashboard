import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable{
  const ChatState();
}

class InitialChatState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessSendState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureSendState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningSendState extends ChatState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}