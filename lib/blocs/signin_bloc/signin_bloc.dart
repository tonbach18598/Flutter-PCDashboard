import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
import 'package:flutter_pcdashboard/models/requests/signin_request.dart';
import 'package:flutter_pcdashboard/models/responses/token_response.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_pcdashboard/utilities/validation.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  @override
  // TODO: implement initialState
  SigninState get initialState => InitialSigninState();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is PressSigninEvent) {
        yield LoadingState();
        if (Validation.isValidUsername(event.username) &&
            event.password.isNotEmpty) {
          if (await onSignin(event.username, event.password))
            yield SuccessPressSigninState();
          else
            yield FailurePressSigninState();
        } else {
          yield WarningPressSigninState();
        }
      } else if (event is PressForgetEvent) {
        yield PressForgetState();
      }
      yield InitialSigninState();
    } catch (e) {
      print(e);
    }
  }
}

Future<bool> onSignin(String username, String password) async {
  try {
    Response response = await Dio().post(Config.baseUrl + Config.tokenPath,
        data: SigninRequest(userId: username, password: password).toJson());
    String token = TokenResponse.fromJson(response.data).tokenType +
        " " +
        TokenResponse.fromJson(response.data).accessToken;
    await PreferencesUtil.saveToken(token);
    await getSelfDetails(token);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future getSelfDetails(String token) async {
  try {
    Response response = await Dio().get(Config.baseUrl + Config.selfPath,
        options: Options(headers: {"Authorization": token}));
    print(response.data);
    SelfResponse self = SelfResponse.fromJson(response.data);
    await PreferencesUtil.saveSelf(self);
  } catch (e) {
    print(e);
  }
}