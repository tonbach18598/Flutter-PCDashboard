import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_event.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_state.dart';
import 'package:flutter_pcdashboard/models/requests/change_password_request.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_pcdashboard/utilities/validation.dart';


class ChangeBloc extends Bloc<ChangeEvent,ChangeState>{
  @override
  // TODO: implement initialState
  ChangeState get initialState => InitialChangeState();

  @override
  Stream<ChangeState> mapEventToState(ChangeEvent event) async* {
    // TODO: implement mapEventToState
    try {
       if (event is PressConfirmEvent) {
        yield LoadingState();
        if (event.oldPassword.isNotEmpty && event.newPassword.isNotEmpty) {
          if (!Validation.isValidPassword(event.oldPassword)||!Validation.isValidPassword(event.newPassword)) {
            yield WarningPasswordPressConfirmState();
          } else if (event.newPassword!=event.retypePassword) {
            yield WarningMatchPressConfirmState();
          } else {
            if (await changePassword(event.oldPassword, event.newPassword)) {
              await onSignout();
              yield SuccessPressConfirmState();
            } else {
              yield FailurePressConfirmState();
            }
          }
        } else {
          yield WarningEmptyPressConfirmState();
        }
      }
      yield InitialChangeState();
    } catch (e) {
      print(e);
    }
  }
}

Future<bool> changePassword(String oldPassword, String newPassword) async {
  try {
    String token = await PreferencesUtil.loadToken();
    String userId = (await PreferencesUtil.loadSelf()).userId;
    Response response = await Dio().put(Config.baseUrl + Config.changePath,
        data:
        ChangePasswordRequest(userId: userId, oldPassword: oldPassword, newPassword: newPassword)
            .toJson(),
        options: Options(headers: {'Authorization': token}));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}

void onSignout() async {
  await PreferencesUtil.clearAll();
}