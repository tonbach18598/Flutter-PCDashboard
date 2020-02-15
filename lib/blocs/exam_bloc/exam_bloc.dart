import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/exam_bloc/exam_event.dart';
import 'package:flutter_pcdashboard/blocs/exam_bloc/exam_state.dart';
import 'package:flutter_pcdashboard/models/responses/exam_response.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';


class ExamBloc extends Bloc<ExamEvent,ExamState>{
  @override
  // TODO: implement initialState
  ExamState get initialState => InitialExamState();

  @override
  Stream<ExamState> mapEventToState(ExamEvent event) async* {
    // TODO: implement mapEventToState
    try{
      if(event is FetchListEvent) {
        yield LoadingState();
        List<ExamResponse> exams=await fetchList();
        if (exams!=null) {
          yield SuccessFetchListState(exams);
        } else {
          yield FailureFetchListState();
        }
      }
    }catch (e){
      print(e);
    }
  }
}

Future<List<ExamResponse>> fetchList()async{
  try {
    String token = await Preferences.loadToken();
    Response response = await Dio().get(
        Configs.baseUrl + Configs.examPath,
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    List<ExamResponse> exams=(response.data as List).map((item)=>ExamResponse.fromJson(item)).toList();
    return exams;
  } catch (e) {
    print(e);
    return null;
  }
}