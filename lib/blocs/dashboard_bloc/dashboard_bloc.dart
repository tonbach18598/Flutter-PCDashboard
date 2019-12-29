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
      if(event is ClickSelfDetailsEvent){
        yield ClickSelfDetailsState();
        yield InitialDashboardState();
      }else if(event is ClickHomeEvent){
        yield ClickHomeState();
        yield InitialDashboardState();
      }else if(event is ClickUpdateInformationEvent){
        yield ClickUpdateInformationState();
        yield InitialDashboardState();
      }else if(event is ClickChangePasswordEvent){
        yield ClickChangePasswordState();
        yield InitialDashboardState();
      }
      else if(event is ClickFeedbackEvent){
        yield ClickFeedbackState();
        yield InitialDashboardState();
      }
      else if(event is ClickSignoutEvent){
        await onSignout();
        yield ClickSignoutState();
      }
    } catch (e) {
      print(e);
    }
  }
  void onSignout()async{
    await PreferencesUtil.clearAll();
  }
}
