import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  @override
  // TODO: implement initialState
  SigninState get initialState => InitialSigninState();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is ClickSigninEvent) {
        if (event.username.isNotEmpty&&event.password.isNotEmpty)
          yield SuccessSigninState();
        else {
          yield FailureSigninState();
          yield InitialSigninState();
        }
      } else if (event is ClickForgetPasswordEvent) {
        yield ClickForgetPasswordState();
        yield InitialSigninState();
      }
    } catch (e) {}
  }
}

