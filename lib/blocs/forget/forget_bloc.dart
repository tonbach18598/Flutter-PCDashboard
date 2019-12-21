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
        if(event is ClickGetPasswordEvent){
          yield ClickGetPasswordState();
        }else if(event is ClickBackEvent){
          yield ClickBackState();
          yield InitialForgetState();
      }
    }catch (e){
      yield ErrorState();
    }
  }
}