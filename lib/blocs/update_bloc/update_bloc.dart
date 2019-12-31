import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_event.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_state.dart';
import 'package:flutter_pcdashboard/models/requests/update_information_request.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_pcdashboard/utilities/validation.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  @override
  // TODO: implement initialState
  UpdateState get initialState => InitialUpdateState();

  @override
  Stream<UpdateState> mapEventToState(UpdateEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is InitializeSelfEvent) {
        SelfResponse self = await initializeSelf();
        yield InitializeSelfState(self);
      } else if (event is PressConfirmEvent) {
        yield LoadingState();
        if (event.email.isNotEmpty && event.phone.isNotEmpty) {
          if (!Validation.isValidEmail(event.email)) {
            yield WarningEmailPressConfirmState();
          } else if (!Validation.isValidPhone(event.phone)) {
            yield WarningPhonePressConfirmState();
          } else {
            SelfResponse self =
                await updateInformation(event.email, event.phone);
            if (self != null) {
              yield SuccessPressConfirmState();
            } else {
              yield FailurePressConfirmState();
            }
          }
        } else {
          yield WarningEmptyPressConfirmState();
        }
      }
      yield InitialUpdateState();
    } catch (e) {
      print(e);
    }
  }
}

Future<SelfResponse> initializeSelf() async {
  SelfResponse self = await PreferencesUtil.loadSelf();
  return self;
}

Future<SelfResponse> updateInformation(String email, String phone) async {
  try {
    String token = await PreferencesUtil.loadToken();
    String userId = (await PreferencesUtil.loadSelf()).userId;
    Response response = await Dio().put(Config.baseUrl + Config.userPath,
        data:
            UpdateInformationRequest(userId: userId, email: email, phone: phone)
                .toJson(),
        options: Options(headers: {'Authorization': token}));
    SelfResponse self = SelfResponse.fromJson(response.data);
    await PreferencesUtil.saveSelf(self);
    return self;
  } catch (e) {
    print(e);
    return null;
  }
}
