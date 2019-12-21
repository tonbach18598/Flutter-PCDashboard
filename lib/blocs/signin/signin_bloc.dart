import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_state.dart';

class SigninBloc extends Bloc<SigninEvent,SigninState>{
  @override
  // TODO: implement initialState
  SigninState get initialState => InitialSigninState();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // TODO: implement mapEventToState
    try{
        if(event is ClickSigninEvent){
          yield ClickSigninState();
        }else if(event is ClickForgetPasswordEvent){
          yield ClickForgetPasswordState();
          yield InitialSigninState();
      }
    }catch (e){
      yield ErrorState();
    }
  }
}