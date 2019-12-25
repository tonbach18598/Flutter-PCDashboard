import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_state.dart';
import 'package:flutter_pcdashboard/utility/config.dart';
import 'package:flutter_pcdashboard/requests/signin_request.dart';
import 'package:flutter_pcdashboard/responses/token_response.dart';
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
        if (Validation.isValidUsername(event.username)&&event.password.isNotEmpty){
          await getToken(event.username, event.password);
          yield SuccessSigninState();
          print("signin");
        }
        else {
          yield WarningSigninState();
          yield InitialSigninState();
        }
      } else if (event is ClickForgetButtonEvent) {
        yield ClickForgetButtonState();
        yield InitialSigninState();
      }
    } catch (e) {}
  }
}

void getToken(String username,String password) async {
  try {
    Response response = await Dio().post(Config.baseUrl+Config.signinUrl,data: SigninRequest(userId: username,password: password).toJson());
    String token=TokenResponse.fromJson(response.data).tokenType+" "+TokenResponse.fromJson(response.data).accessToken;
    print(token);
  } catch (e) {
    print(e);
  }
}

