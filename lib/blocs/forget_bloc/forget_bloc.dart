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
        if(event is ClickGetPasswordEvent){
          if(event.username.isNotEmpty){
            yield SuccessGetPasswordState();
            yield InitialForgetState();
          }
          else {
          yield WarningGetPasswordState();
          yield InitialForgetState();
          }
        }else if(event is ClickBackEvent){
          yield ClickBackState();
          yield InitialForgetState();
      }
    }catch (e){
      print(e);
    }
  }
}