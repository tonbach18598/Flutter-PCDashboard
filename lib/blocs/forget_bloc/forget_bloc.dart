import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_event.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_state.dart';

class ForgetBloc extends Bloc<ForgetEvent, ForgetState> {
  @override
  // TODO: implement initialState
  ForgetState get initialState => InitialForgetState();

  @override
  Stream<ForgetState> mapEventToState(ForgetEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is PressGetPasswordEvent) {
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
  return true;
//  try {
//    String token = await PreferencesUtil.loadToken();
//    String userId = (await PreferencesUtil.loadSelf()).userId;
//    Response response = await Dio().put(Config.baseUrl + Config.changePath,
//        data:
//        ChangePasswordRequest(userId: userId, oldPassword: oldPassword, newPassword: newPassword)
//            .toJson(),
//        options: Options(headers: {'Authorization': token}));
//    return response.data;
//  } catch (e) {
//    print(e);
//    return false;
//  }
}
