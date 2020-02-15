import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_event.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_state.dart';
import 'package:flutter_pcdashboard/models/requests/update_information_request.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_pcdashboard/utilities/validations.dart';

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
          if (!Validations.isValidEmail(event.email)) {
            yield WarningEmailPressConfirmState();
          } else if (!Validations.isValidPhone(event.phone)) {
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
  SelfResponse self = await Preferences.loadSelf();
  return self;
}

Future<SelfResponse> updateInformation(String email, String phone) async {
  try {
    String token = await Preferences.loadToken();
    String userId = (await Preferences.loadSelf()).userId;
    Response response = await Dio().put(Configs.baseUrl + Configs.userPath,
        data:
            UpdateInformationRequest(userId: userId, email: email, phone: phone)
                .toJson(),
        options: Options(headers: {'Authorization': token})).timeout(const Duration(milliseconds: 3000));
    SelfResponse self = SelfResponse.fromJson(response.data);
    await Preferences.saveSelf(self);
    return self;
  } catch (e) {
    print(e);
    return null;
  }
}
