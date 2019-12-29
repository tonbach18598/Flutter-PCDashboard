import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_event.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_state.dart';


class PostBloc extends Bloc<PostEvent,PostState>{
  @override
  // TODO: implement initialState
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    // TODO: implement mapEventToState
    try{

    }catch (e){
      print(e);
    }
  }
}