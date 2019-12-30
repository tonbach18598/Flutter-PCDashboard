import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_event.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_state.dart';

class ForgetBloc extends Bloc<ForgetEvent,ForgetState>{
  @override
  // TODO: implement initialState
  ForgetState get initialState => InitialForgetState();

  @override
  Stream<ForgetState> mapEventToState(ForgetEvent event) async* {
    // TODO: implement mapEventToState
    try{
        if(event is PressGetPasswordEvent){
          if(event.username.isNotEmpty){
            yield SuccessPressGetPasswordState();
            yield InitialForgetState();
          }
          else {
          yield WarningPressGetPasswordState();
          yield InitialForgetState();
          }
        }else if(event is PressBackEvent){
          yield PressBackState();
          yield InitialForgetState();
      }
    }catch (e){
      print(e);
    }
  }
}