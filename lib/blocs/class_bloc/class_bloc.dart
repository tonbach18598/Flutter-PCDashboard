import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_event.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_state.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utility/config.dart';
import 'package:flutter_pcdashboard/utility/preferences.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  @override
  // TODO: implement initialState
  ClassState get initialState => InitialClassState();

  @override
  Stream<ClassState> mapEventToState(ClassEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is FetchListEvent) {
        yield LoadingState();
        List<ClassResponse> posts = await fetchList(event.number);
        if (posts != null) {
          yield SuccessFetchListState(posts);
        } else {
          yield FailureFetchListState();
        }
        yield InitialClassState();
      }
    } catch (e) {
      print(e);
    }
  }
}

Future<List<ClassResponse>> fetchList(int number) async {
  try {
    String token = await PreferencesUtil.loadToken();
    SelfResponse self = await PreferencesUtil.loadSelf();
    Response response = await Dio().get(
        Config.baseUrl + Config.classPath + "K16",
        queryParameters: {"number": number},
        options: Options(headers: {"Authorization": token}));
    print(response.data);
    List<ClassResponse> posts = (response.data as List)
        .map((item) => ClassResponse.fromJson(item))
        .toList();
    return posts;
  } catch (e) {
    print(e);
    return null;
  }
}
