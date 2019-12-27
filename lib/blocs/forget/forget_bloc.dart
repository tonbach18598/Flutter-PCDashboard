import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget/forget_event.dart';
import 'package:flutter_pcdashboard/blocs/forget/forget_state.dart';

class ForgetBloc extends Bloc<ForgetEvent,ForgetState>{
  @override
  // TODO: implement initialState
  ForgetState get initialState => InitialForgetState();

  @override
  Stream<ForgetState> mapEventToState(ForgetEvent event) async* {
    // TODO: implement mapEventToState
    try{
        if(event is ClickGetPasswordButtonEvent){
          if(event.username.isNotEmpty){
            yield SuccessGetPasswordState();
            yield InitialForgetState();
          }
          else {
          yield WarningGetPasswordState();
          yield InitialForgetState();
          }
        }else if(event is ClickBackButtonEvent){
          yield ClickBackButtonState();
          yield InitialForgetState();
      }
    }catch (e){
      print(e);
    }
  }
}