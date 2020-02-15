import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/models/requests/signin_request.dart';
import 'package:flutter_pcdashboard/models/responses/token_response.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_pcdashboard/utilities/validations.dart';

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
        if (event.username.isNotEmpty &&
            event.password.isNotEmpty) {
          if (await onSignin(event.username, event.password))
            yield SuccessPressSigninState();
          else
            yield FailurePressSigninState();
        } else {
          yield WarningPressSigninState();
        }
      } else if (event is PressForgetEvent) {
        yield SuccessPressForgetState();
      }
      yield InitialSigninState();
    } catch (e) {
      print(e);
    }
  }
}

Future<bool> onSignin(String username, String password) async {
  try {
    Response response = await Dio().post(Configs.baseUrl + Configs.tokenPath,queryParameters: {'account':'student'},
        data: SigninRequest(userId: username, password: password).toJson()).timeout(const Duration(milliseconds: 3000));
    String token = TokenResponse.fromJson(response.data).tokenType +
        ' ' +
        TokenResponse.fromJson(response.data).accessToken;
    await Preferences.saveToken(token);
    await getSelfDetails(token);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future getSelfDetails(String token) async {
  try {
    Response response = await Dio().get(Configs.baseUrl + Configs.userPath,
        options: Options(headers: {'Authorization': token}));
    SelfResponse self = SelfResponse.fromJson(response.data);
    await Preferences.saveSelf(self);
  } catch (e) {
    print(e);
  }
}
