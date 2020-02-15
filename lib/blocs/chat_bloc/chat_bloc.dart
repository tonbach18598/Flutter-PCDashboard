import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_event.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_state.dart';
import 'package:flutter_pcdashboard/models/responses/chat_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';

class ChatBloc extends Bloc<ChatEvent,ChatState>{
  SocketIO socket;

  @override
  // TODO: implement initialState
  ChatState get initialState => InitialChatState();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is FetchListEvent) {
        yield LoadingState();
        List<ChatResponse> messages = await fetchList(event.number);
        if (messages != null) {
          yield SuccessFetchListState(messages,event.number+10,event.scroll);
        } else {
          yield FailureFetchListState();
        }
      }
      yield InitialChatState();
    } catch (e) {
      print(e);
    }
  }
}

Future<List<ChatResponse>> fetchList(int number) async {
  try {
    String token = await Preferences.loadToken();
    Response response = await Dio().get(
        Configs.baseUrl + Configs.chatPath,
        queryParameters: {'number':number},
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    List<ChatResponse> messages = (response.data as List)
        .map((item) => ChatResponse.fromJson(item))
        .toList();
    return messages;
  } catch (e) {
    print(e);
    return null;
  }
}

