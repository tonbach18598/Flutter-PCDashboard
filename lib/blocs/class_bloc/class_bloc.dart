import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_event.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_state.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  @override
  // TODO: implement initialState
  ClassState get initialState => InitialClassState();

  @override
  Stream<ClassState> mapEventToState(ClassEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is InitializeSelfEvent) {
        SelfResponse self = await initializeSelf();
        yield InitializeSelfState(self);
      } else if (event is FetchListEvent) {
        yield LoadingState();
        List<ClassResponse> posts = await fetchList(event.number);
        if (posts != null) {
          yield SuccessFetchListState(posts, event.number + 10);
        } else {
          yield FailureFetchListState();
        }
      } else if (event is TapPostEvent) {
        yield SuccessTapPostState();
      } else if (event is TapCommentEvent) {
        yield SuccessTapCommentState(event.post);
      } else if (event is PressMoreEvent) {
        yield SuccessPressMoreState(event.post);
      } else if (event is PressEditEvent) {
        if (await isEditable(event.post.userId)) {
          yield SuccessPressEditState(event.post);
        } else
          yield FailurePressEditState();
      } else if (event is PressDeleteEvent) {
        yield LoadingState();
        if (await deletePost(event.post.id)) {
          yield SuccessPressDeleteState(event.post);
        } else
          yield FailurePressDeleteState();
      } else if (event is PressCancelEvent) {
        yield SuccessPressCancelState();
      }
      yield InitialClassState();
    } catch (e) {
      print(e);
    }
  }
}

Future<SelfResponse> initializeSelf() async {
  SelfResponse self = await Preferences.loadSelf();
  return self;
}

Future<List<ClassResponse>> fetchList(int number) async {
  try {
    String token = await Preferences.loadToken();
    SelfResponse self = await Preferences.loadSelf();
    Response response = await Dio().get(
        Configs.baseUrl + Configs.classPath + self.classId,
        queryParameters: {'number': number},
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    List<ClassResponse> posts = (response.data as List)
        .map((item) => ClassResponse.fromJson(item))
        .toList();
    return posts;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<bool> isEditable(String userId) async {
  String selfId = (await Preferences.loadSelf()).userId;
  return selfId==userId;
}

Future<bool> deletePost(String postId) async {
  try {
    String token = await Preferences.loadToken();
    Response response = await Dio().delete(
        Configs.baseUrl + Configs.classPath + postId,
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}
