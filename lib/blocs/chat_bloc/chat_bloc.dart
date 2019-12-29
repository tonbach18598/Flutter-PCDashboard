import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_event.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_state.dart';


class ChatBloc extends Bloc<ChatEvent,ChatState>{
  @override
  // TODO: implement initialState
  ChatState get initialState => InitialChatState();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    // TODO: implement mapEventToState
    try{

    }catch (e){
      print(e);
    }
  }
}