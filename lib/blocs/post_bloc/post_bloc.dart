import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_event.dart';
import 'package:flutter_pcdashboard/blocs/post_bloc/post_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:image_picker/image_picker.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  // TODO: implement initialState
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is InitializeSelfEvent) {
        SelfResponse self = await initializeSelf();
        yield InitializeSelfState(self);
      } else if (event is PressPostEvent) {
        yield LoadingState();
        if (event.content.isNotEmpty) {
          if (await createPost(event.content, event.image)) {
            yield SuccessPressPostState();
          } else {
            yield FailurePressPostState();
          }
        } else {
          yield WarningPressPostState();
        }
      } else if (event is TapImageEvent) {
        File image = await getImage();
        yield SuccessTapImageState(image);
      }
      yield InitialPostState();
    } catch (e) {
      print(e);
    }
  }
}

Future<SelfResponse> initializeSelf() async {
  SelfResponse self = await Preferences.loadSelf();
  return self;
}

Future<bool> createPost(String content, File image) async {
  try {
    String token = await Preferences.loadToken();
    String classId = (await Preferences.loadSelf()).classId;
    Response response;
    if (image == null) {
      response = await Dio().post(Configs.baseUrl + Configs.classPath,
          queryParameters: {'content': content, 'classId': classId},
          options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    } else {
      response = await Dio().post(Configs.baseUrl + Configs.classPath,
          queryParameters: {'content': content, 'classId': classId},
          options: Options(headers: {'Authorization': token}),
          data: FormData.fromMap({
            'file': await MultipartFile.fromFile(image.path),
          })).timeout(const Duration(milliseconds: 3000));
    }
    return response.data;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<File> getImage() async {
  File image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}
