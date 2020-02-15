import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/schedule_bloc/schedule_event.dart';
import 'package:flutter_pcdashboard/blocs/schedule_bloc/schedule_state.dart';
import 'package:flutter_pcdashboard/models/responses/schedule_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  @override
  // TODO: implement initialState
  ScheduleState get initialState => InitialScheduleState();

  @override
  Stream<ScheduleState> mapEventToState(ScheduleEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is FetchListEvent) {
        yield LoadingState();
        List<ScheduleResponse> schedules = await fetchList();
        if (schedules != null) {
          yield SuccessFetchListState(schedules);
        } else {
          yield FailureFetchListState();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

Future<List<ScheduleResponse>> fetchList() async {
  try {
    String token = await Preferences.loadToken();
    String classId = (await Preferences.loadSelf()).classId;
    Response response = await Dio().get(
        Configs.baseUrl + Configs.schedulePath + classId,
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    List<ScheduleResponse> schedules = (response.data as List)
        .map((item) => ScheduleResponse.fromJson(item))
        .toList();
    return schedules;
  } catch (e) {
    print(e);
    return null;
  }
}
