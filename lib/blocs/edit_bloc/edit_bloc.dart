import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/edit_bloc/edit_event.dart';
import 'package:flutter_pcdashboard/blocs/edit_bloc/edit_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';


class EditBloc extends Bloc<EditEvent,EditState>{
  @override
  // TODO: implement initialState
  EditState get initialState => InitialEditState();

  @override
  Stream<EditState> mapEventToState(EditEvent event) async* {
    // TODO: implement mapEventToState
    try{
      if(event is InitializeSelfEvent){
        SelfResponse self=await initializeSelf();
        yield InitializeSelfState(self);
      }else if(event is PressEditEvent){
        yield LoadingState();
        if(event.newContent.isNotEmpty){
          if(await updatePost(event.post.id,event.newContent)){
            yield SuccessPressEditState();
          }else{
            yield FailurePressEditState();
          }
        }else{
          yield WarningPressEditState();
        }
      }
    }catch (e){
      print(e);
    }
  }
}

Future<SelfResponse> initializeSelf()async{
  SelfResponse self=await Preferences.loadSelf();
  return self;
}

Future<bool> updatePost(String postId,String content)async{
  try {
    String token = await Preferences.loadToken();
    Response response = await Dio().put(
        Configs.baseUrl + Configs.classPath+postId,
        queryParameters: {'content': content},
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}