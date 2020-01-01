import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_event.dart';
import 'package:flutter_pcdashboard/blocs/chat_bloc/chat_state.dart';
import 'package:flutter_pcdashboard/models/responses/chat_response.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
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
          yield SuccessFetchListState(messages);
        } else {
          yield FailureFetchListState();
        }
      } else if (event is PressSendEvent) {
        yield LoadingState();
        if (event.content.isNotEmpty) {

        } else {
          yield WarningPressSendState();
        }
      } else if (event is ConnectSocketEvent) {
        yield ConnectSocketState();
      }
      yield InitialChatState();
    } catch (e) {
      print(e);
    }
  }
}

Future<List<ChatResponse>> fetchList(int number) async {
  try {
    String token = await PreferencesUtil.loadToken();
    Response response = await Dio().get(
        Config.baseUrl + Config.chatPath,
        queryParameters: {'number':number},
        options: Options(headers: {'Authorization': token}));
    List<ChatResponse> messages = (response.data as List)
        .map((item) => ChatResponse.fromJson(item))
        .toList();
    return messages;
  } catch (e) {
    print(e);
    return null;
  }
}