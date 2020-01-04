import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_event.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';


class PostBloc extends Bloc<PostEvent,PostState>{
  @override
  // TODO: implement initialState
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    // TODO: implement mapEventToState
    try{
      if(event is InitializeSelfEvent){
        SelfResponse self=await initializeSelf();
        yield InitializeSelfState(self);
      }else if(event is PressPostEvent){
        yield LoadingState();
        if(event.content.isNotEmpty){
          if(await createPost(event.content)){
            yield SuccessPressPostState();
          }else{
            yield FailurePressPostState();
          }
        }else{
          yield WarningPressPostState();
        }
      }
    }catch (e){
      print(e);
    }
  }
}

Future<SelfResponse> initializeSelf()async{
  SelfResponse self=await PreferencesUtil.loadSelf();
  return self;
}

Future<bool> createPost(String content)async{
  try {
    String token = await PreferencesUtil.loadToken();
    String classId=(await PreferencesUtil.loadSelf()).classId;
    Response response = await Dio().post(
        Config.baseUrl + Config.classPath,
        queryParameters: {'content': content,'classId':classId},
        options: Options(headers: {'Authorization': token}));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}