import 'package:equatable/equatable.dart';


abstract class DepartmentEvent extends Equatable{
  const DepartmentEvent();
}

class FetchListEvent extends DepartmentEvent{
  int number;
  FetchListEvent(this.number);

  @override
  // TODO: implement props
  List<Object> get props => null;
}