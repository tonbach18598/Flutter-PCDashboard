import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_event.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_state.dart';
import 'package:flutter_pcdashboard/models/responses/user_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  // TODO: implement initialState
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is FetchListEvent) {
        yield LoadingState();
        List<UserResponse> users = await fetchList(event.classId);
        if (users != null) {
          yield SuccessFetchListState(users);
        } else {
          yield FailureFetchListState();
        }
      } else if (event is TapUserEvent) {
        yield TapUserState(event.user);
      } else if (event is TapEmailEvent) {
        if (!(await launchEmail(event.email))) yield FailureTapEmailState();
      } else if (event is TapPhoneEvent) {
        if (!(await launchPhone(event.phone))) yield FailureTapPhoneState();
      }
      yield InitialUserState();
    } catch (e) {
      print(e);
    }
  }
}

Future<List<UserResponse>> fetchList(String classId) async {
  try {
    String token = await Preferences.loadToken();
    if (classId != 'GV') classId = (await Preferences.loadSelf()).classId;
    Response response = await Dio().get(
        Configs.baseUrl + Configs.userPath + classId,
        options: Options(headers: {"Authorization": token})).timeout(const Duration(milliseconds: 3000));
    List<UserResponse> users = (response.data as List)
        .map((item) => UserResponse.fromJson(item))
        .toList();
    return users;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<bool> launchEmail(String email) async {
  String url = 'mailto:$email';
  if (await canLaunch(url) && email != (await Preferences.loadSelf()).email) {
    await launch(url);
    return true;
  } else
    return false;
}

Future<bool> launchPhone(String phone) async {
  String url = 'tel:$phone';
  if (await canLaunch(url) && phone != (await Preferences.loadSelf()).phone) {
    await launch(url);
    return true;
  } else
    return false;
}
