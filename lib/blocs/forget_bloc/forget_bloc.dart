import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_event.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_state.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
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
        yield SuccessPressBackState();
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
        await Dio().put(Configs.baseUrl + Configs.forgetPath + userId).timeout(const Duration(milliseconds: 3000));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}
