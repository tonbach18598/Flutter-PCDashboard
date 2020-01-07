import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_event.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  @override
  // TODO: implement initialState
  DashboardState get initialState => InitialDashboardState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is InitializeSelfEvent) {
        SelfResponse self=await initializeSelf();
        yield InitializeSelfState(self);
      } else if (event is TapSelfDetailsEvent) {
        yield TapSelfDetailsState();
      } else if (event is TapHomeEvent) {
        yield TapHomeState();
      } else if (event is TapUpdateInformationEvent) {
        yield TapUpdateInformationState();
      } else if (event is TapChangePasswordEvent) {
        yield TapChangePasswordState();
      } else if (event is TapFeedbackEvent) {
        yield TapFeedbackState();
      } else if (event is TapSignoutEvent) {
        await onSignout();
        yield TapSignoutState();
      }
      yield InitialDashboardState();
    } catch (e) {
      print(e);
    }
  }

  Future<SelfResponse> initializeSelf()async{
    SelfResponse self=await Preferences.loadSelf();
    return self;
  }

  void onSignout() async {
    await Preferences.clearAll();
  }
}
