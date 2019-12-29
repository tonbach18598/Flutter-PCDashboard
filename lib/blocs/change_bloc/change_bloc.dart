import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_event.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_state.dart';


class ChangeBloc extends Bloc<ChangeEvent,ChangeState>{
  @override
  // TODO: implement initialState
  ChangeState get initialState => InitialChangeState();

  @override
  Stream<ChangeState> mapEventToState(ChangeEvent event) async* {
    // TODO: implement mapEventToState
    try{

    }catch (e){
      print(e);
    }
  }
}