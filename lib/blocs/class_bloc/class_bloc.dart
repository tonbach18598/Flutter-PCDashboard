import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_event.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_state.dart';


class ClassBloc extends Bloc<ClassEvent,ClassState>{
  @override
  // TODO: implement initialState
  ClassState get initialState => InitialClassState();

  @override
  Stream<ClassState> mapEventToState(ClassEvent event) async* {
    // TODO: implement mapEventToState
    try{

    }catch (e){
      print(e);
    }
  }
}