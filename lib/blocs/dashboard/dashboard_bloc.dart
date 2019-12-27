import 'package:bloc/bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard/dashboard_event.dart';
import 'package:flutter_pcdashboard/blocs/dashboard/dashboard_state.dart';
import 'package:flutter_pcdashboard/utility/shared_preferences.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  @override
  // TODO: implement initialState
  DashboardState get initialState => InitialDashboardState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if(event is ClickSelfDetailsDrawerEvent){
        yield ClickSelfDetailsDrawerState();
        yield InitialDashboardState();
      }else if(event is ClickHomeDrawerEvent){
        yield ClickHomeDrawerState();
        yield InitialDashboardState();
      }else if(event is ClickUpdateInformationDrawerEvent){
        yield ClickUpdateInformationDrawerState();
        yield InitialDashboardState();
      }else if(event is ClickChangePasswordDrawerEvent){
        yield ClickChangePasswordDrawerState();
        yield InitialDashboardState();
      }
      else if(event is ClickFeedbackDrawerEvent){
        yield ClickChangePasswordDrawerState();
        yield InitialDashboardState();
      }
      else if(event is ClickSignoutDrawerEvent){
        await onSignout();
        yield ClickSignoutDrawerState();
      }
    } catch (e) {
      print(e);
    }
  }
  void onSignout()async{
    await PreferencesUtil.saveToken(null);
  }
}
