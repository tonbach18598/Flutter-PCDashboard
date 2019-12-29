import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/feedback_bloc/feedback_event.dart';
import 'package:flutter_pcdashboard/blocs/feedback_bloc/feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent,FeedbackState>{
  @override
  // TODO: implement initialState
  FeedbackState get initialState => InitialFeedbackState();

  @override
  Stream<FeedbackState> mapEventToState(FeedbackEvent event) async* {
    // TODO: implement mapEventToState
    try{

    }catch (e){
      print(e);
    }
  }
}