import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_event.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_state.dart';
import 'package:flutter_pcdashboard/models/requests/change_password_request.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_pcdashboard/utilities/validations.dart';


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
          if (!Validations.isValidPassword(event.oldPassword)||!Validations.isValidPassword(event.newPassword)) {
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
    String token = await Preferences.loadToken();
    String userId = (await Preferences.loadSelf()).userId;
    Response response = await Dio().put(Configs.baseUrl + Configs.changePath,
        data:
        ChangePasswordRequest(userId: userId, oldPassword: oldPassword, newPassword: newPassword)
            .toJson(),
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<void> onSignout() async {
  await Preferences.clearAll();
}