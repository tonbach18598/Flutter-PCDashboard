import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_event.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_state.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';

class ForgetBloc extends Bloc<ForgetEvent, ForgetState> {
  @override
  // TODO: implement initialState
  ForgetState get initialState => InitialForgetState();

  @override
  Stream<ForgetState> mapEventToState(ForgetEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is PressGetPasswordEvent) {
        yield LoadingState();
        if (event.username.isNotEmpty) {
          if (await getPassword(event.username)) {
            yield SuccessPressGetPasswordState();
          } else {
            yield FailurePressGetPasswordState();
          }
        } else {
          yield WarningPressGetPasswordState();
        }
      } else if (event is PressBackEvent) {
        yield PressBackState();
      }
      yield InitialForgetState();
    } catch (e) {
      print(e);
    }
  }
}

Future<bool> getPassword(String userId) async {
  try {
    Response response =
        await Dio().put(Config.baseUrl + Config.forgetPath + userId);
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}
