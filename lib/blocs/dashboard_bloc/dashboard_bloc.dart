import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_event.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_state.dart';
import 'package:flutter_pcdashboard/utility/preferences.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  @override
  // TODO: implement initialState
  DashboardState get initialState => InitialDashboardState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if(event is TapSelfDetailsEvent){
        yield TapSelfDetailsState();
        yield InitialDashboardState();
      }else if(event is TapHomeEvent){
        yield TapHomeState();
        yield InitialDashboardState();
      }else if(event is TapUpdateInformationEvent){
        yield TapUpdateInformationState();
        yield InitialDashboardState();
      }else if(event is TapChangePasswordEvent){
        yield TapChangePasswordState();
        yield InitialDashboardState();
      }
      else if(event is TapFeedbackEvent){
        yield TapFeedbackState();
        yield InitialDashboardState();
      }
      else if(event is TapSignoutEvent){
        await onSignout();
        yield TapSignoutState();
      }
    } catch (e) {
      print(e);
    }
  }
  void onSignout()async{
    await PreferencesUtil.clearAll();
  }
}
