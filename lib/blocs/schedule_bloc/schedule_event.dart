import 'package:equatable/equatable.dart';


abstract class ScheduleEvent extends Equatable{
  const ScheduleEvent();
}

class FetchListEvent extends ScheduleEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}