import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_state.dart';
import 'package:flutter_pcdashboard/utility/config.dart';
import 'package:flutter_pcdashboard/models/requests/signin_request.dart';
import 'package:flutter_pcdashboard/models/responses/token_response.dart';
import 'package:flutter_pcdashboard/utility/shared_preferences.dart';
import 'package:flutter_pcdashboard/utility/validation.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  @override
  // TODO: implement initialState
  SigninState get initialState => InitialSigninState();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is ClickSigninButtonEvent) {
        yield LoadingState();
        if (Validation.isValidUsername(event.username) &&
            event.password.isNotEmpty) {
          if(await onSignin(event.username, event.password))
            yield SuccessSigninState();
          else yield FailureSigninState();
        } else {
          yield WarningSigninState();
          yield InitialSigninState();
        }
      } else if (event is ClickForgetButtonEvent) {
        yield ClickForgetButtonState();
        yield InitialSigninState();
      }
    } catch (e) {
      print(e);
    }
  }
}

Future<bool> onSignin(String username, String password) async {
  try {
    Response response = await Dio().post(Config.baseUrl + Config.signinUrl,
        data: SigninRequest(userId: username, password: password).toJson());
    String token = TokenResponse.fromJson(response.data).tokenType +
        " " +
        TokenResponse.fromJson(response.data).accessToken;
    await PreferencesUtil.saveToken(token);
    await getSelfDetails(token);
    return true;
  } catch (e) {
    print(e);
  }
}

Future getSelfDetails(String token) async {
  try {
    Response response = await Dio().get(Config.baseUrl + Config.selfUrl,
        options: Options(headers: {"Authorization": token}));
    print(response.data);
  } catch (e) {
    print(e);
  }
}
