import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/developer_bloc/developer_event.dart';
import 'package:flutter_pcdashboard/blocs/developer_bloc/developer_state.dart';

class DeveloperBloc extends Bloc<DeveloperEvent,DeveloperState>{
  @override
  // TODO: implement initialState
  DeveloperState get initialState => InitialDeveloperState();

  @override
  Stream<DeveloperState> mapEventToState(DeveloperEvent event) async* {
    // TODO: implement mapEventToState
    try{

    }catch (e){
      print(e);
    }
  }
}