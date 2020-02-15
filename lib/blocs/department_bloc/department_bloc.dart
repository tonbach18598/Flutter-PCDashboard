
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/department_bloc/department_event.dart';
import 'package:flutter_pcdashboard/blocs/department_bloc/department_state.dart';
import 'package:flutter_pcdashboard/models/responses/department_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';


class DepartmentBloc extends Bloc<DepartmentEvent,DepartmentState>{
  @override
  // TODO: implement initialState
  DepartmentState get initialState => InitialDepartmentState();

  @override
  Stream<DepartmentState> mapEventToState(DepartmentEvent event) async* {
    // TODO: implement mapEventToState
    try{
      if(event is FetchListEvent){
        yield LoadingState();
        List<DepartmentResponse>posts=await fetchList(event.number);
        if(posts!=null)
          yield SuccessFetchListState(posts,event.number+10);
        else yield FailureFetchListState();
      }
      yield InitialDepartmentState();
    }catch (e){
      print(e);
    }
  }
}

Future<List<DepartmentResponse>> fetchList(int number)async{
  try{
    String token=await Preferences.loadToken();
    Response response=await Dio().get(Configs.baseUrl+Configs.departmentPath,queryParameters: {'number':number},options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    List<DepartmentResponse> posts=(response.data as List).map((item)=>DepartmentResponse.fromJson(item)).toList();
    return posts;
  }catch (e){
    print(e);
    return null;
  }
}