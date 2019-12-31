import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/comment_bloc/comment_event.dart';
import 'package:flutter_pcdashboard/blocs/comment_bloc/comment_state.dart';
import 'package:flutter_pcdashboard/models/responses/comment_response.dart';
import 'package:flutter_pcdashboard/utility/config.dart';
import 'package:flutter_pcdashboard/utility/preferences.dart';


class CommentBloc extends Bloc<CommentEvent,CommentState>{
  @override
  // TODO: implement initialState
  CommentState get initialState => InitialCommentState();

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    // TODO: implement mapEventToState
    try{
      if(event is FetchListEvent){
        yield LoadingState();
        List<CommentResponse> comments = await fetchList(event.postId);
        if (comments != null) {
          yield SuccessFetchListState(comments);
        } else {
          yield FailureFetchListState();
        }
      }else if(event is PressSendEvent){

      }else if(event is PressEditEvent){
        yield PressEditState();
      }else if(event is PressDeleteEvent){
        yield PressDeleteState();
      }
      yield InitialCommentState();
    }catch (e){
      print(e);
    }
  }
}

Future<List<CommentResponse>> fetchList(String postId)async{
  try{
    String token=await PreferencesUtil.loadToken();
    Response response=await Dio().get(Config.baseUrl+Config.commentPath+postId,options: Options(headers: {"Authorization": token}));
    print(token);
    print(Config.baseUrl+Config.commentPath+postId);
    print(response.data);
    List<CommentResponse> comments=(response.data as List).map((item)=>CommentResponse.fromJson(item)).toList();
    return comments;
  }catch (e){
    print(e);
    return null;
  }
}