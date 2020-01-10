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
        yield SuccessTapSelfDetailsState();
      } else if (event is TapHomeEvent) {
        yield SuccessTapHomeState();
      } else if (event is TapUpdateInformationEvent) {
        yield SuccessTapUpdateInformationState();
      } else if (event is TapChangePasswordEvent) {
        yield SuccessTapChangePasswordState();
      } else if (event is TapDeveloperEvent) {
        yield SuccessTapDeveloperState();
      } else if (event is TapSignoutEvent) {
        await onSignout();
        yield SuccessTapSignoutState();
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

  Future<void> onSignout() async {
    await Preferences.clearAll();
  }
}
