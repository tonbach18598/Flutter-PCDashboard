import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_event.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent,UpdateState>{
  @override
  // TODO: implement initialState
  UpdateState get initialState => InitialUpdateState();

  @override
  Stream<UpdateState> mapEventToState(UpdateEvent event) async* {
    // TODO: implement mapEventToState
    try{

    }catch (e){
      print(e);
    }
  }
}