import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_event.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';

class UpdateBloc extends Bloc<UpdateEvent,UpdateState>{
  @override
  // TODO: implement initialState
  UpdateState get initialState => InitialUpdateState();

  @override
  Stream<UpdateState> mapEventToState(UpdateEvent event) async* {
    // TODO: implement mapEventToState
    try{
      if(event is InitSelfEvent){
        SelfResponse self=await initSelf();
        yield InitSelfState(self);
      }
      yield InitialUpdateState();
    }catch (e){
      print(e);
    }
  }
}

Future<SelfResponse> initSelf()async{
  SelfResponse self=await PreferencesUtil.loadSelf();
  return self;
}