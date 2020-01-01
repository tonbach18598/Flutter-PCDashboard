import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_event.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_state.dart';
import 'package:flutter_pcdashboard/models/responses/user_response.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';


class UserBloc extends Bloc<UserEvent,UserState>{
  @override
  // TODO: implement initialState
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // TODO: implement mapEventToState
    try{
      if(event is FetchListEvent){
        yield LoadingState();
        List<UserResponse>users=await fetchList(event.classId);
        if(users!=null){
          yield SuccessFetchListState(users);
        }else{
          yield FailureFetchListState();
        }
      }else if(event is TapUserEvent){
        yield TapUserState(event.user);
      }
      yield InitialUserState();
    }catch (e){
      print(e);
    }
  }
}

Future<List<UserResponse>> fetchList(String classId)async{
  try{
    String token=await PreferencesUtil.loadToken();
    if(classId!='GV')
      classId=(await PreferencesUtil.loadSelf()).classId;
  Response response=await Dio().get(Config.baseUrl+Config.userPath+classId,options: Options(headers: {"Authorization": token}));
  List<UserResponse> users=(response.data as List).map((item)=>UserResponse.fromJson(item)).toList();
  return users;
  }catch (e){
    print(e);
    return null;
  }
}