import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_event.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_state.dart';


class UserBloc extends Bloc<UserEvent,UserState>{
  @override
  // TODO: implement initialState
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // TODO: implement mapEventToState
    try{

    }catch (e){
      print(e);
    }
  }
}