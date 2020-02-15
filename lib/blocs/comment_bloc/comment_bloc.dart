import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/comment_bloc/comment_event.dart';
import 'package:flutter_pcdashboard/blocs/comment_bloc/comment_state.dart';
import 'package:flutter_pcdashboard/models/responses/comment_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  @override
  // TODO: implement initialState
  CommentState get initialState => InitialCommentState();

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is FetchListEvent) {
        yield LoadingState();
        List<CommentResponse> comments = await fetchList(event.postId);
        if (comments != null) {
          yield SuccessFetchListState(comments);
        } else {
          yield FailureFetchListState();
        }
      } else if (event is PressSendEvent) {
        yield LoadingState();
        if (event.content.isNotEmpty) {
          if (await createComment(event.postId, event.content)) {
            yield SuccessPressSendState();
          } else {
            yield FailurePressSendState();
          }
        } else {
          yield WarningPressSendState();
        }
      } else if (event is PressEditEvent) {
        if(await isEditable(event.comment.userId)){
          yield SuccessPressEditState(event.comment);
        } else yield FailurePressEditState();
      } else if (event is PressConfirmEvent) {
        if (event.newContent.isNotEmpty) {
          if (await editComment(event.comment.id, event.newContent)) {
            yield SuccessPressConfirmState();
          } else {
            yield FailurePressConfirmState();
          }
        } else {
          yield WarningPressConfirmState();
        }
      } else if (event is PressCancelEvent) {
        yield SuccessPressCancelState();
      } else if (event is PressDeleteEvent) {
        yield LoadingState();
        if (await deleteComment(event.comment.id)) {
          yield SuccessPressDeleteState(event.comment);
        } else
          yield FailurePressDeleteState();
      }
      yield InitialCommentState();
    } catch (e) {
      print(e);
    }
  }
}

Future<List<CommentResponse>> fetchList(String postId) async {
  try {
    String token = await Preferences.loadToken();
    Response response = await Dio().get(
        Configs.baseUrl + Configs.commentPath + postId,
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    List<CommentResponse> comments = (response.data as List)
        .map((item) => CommentResponse.fromJson(item))
        .toList();
    return comments;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<bool> isEditable(String userId) async {
  String selfId = (await Preferences.loadSelf()).userId;
  return selfId==userId;
}

Future<bool> editComment(String commentId, String content) async {
  try {
    String token = await Preferences.loadToken();
    Response response = await Dio().put(
        Configs.baseUrl + Configs.commentPath + commentId,
        queryParameters: {'content': content},
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> deleteComment(String commentId) async {
  try {
    String token = await Preferences.loadToken();
    Response response = await Dio().delete(
        Configs.baseUrl + Configs.commentPath + commentId,
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> createComment(String postId, String content) async {
  try {
    String token = await Preferences.loadToken();
    Response response = await Dio().post(
        Configs.baseUrl + Configs.commentPath + postId,
        queryParameters: {'content': content},
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}
