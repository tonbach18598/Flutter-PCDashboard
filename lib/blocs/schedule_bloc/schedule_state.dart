import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/schedule_response.dart';

abstract class ScheduleState extends Equatable{
  const ScheduleState();
}

class InitialScheduleState extends ScheduleState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadingState extends ScheduleState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessFetchListState extends ScheduleState{
  List<ScheduleResponse> schedules;

  SuccessFetchListState(this.schedules);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureFetchListState extends ScheduleState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}