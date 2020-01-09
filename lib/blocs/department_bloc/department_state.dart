import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/department_response.dart';

abstract class DepartmentState extends Equatable{
  const DepartmentState();
}

class InitialDepartmentState extends DepartmentState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadingState extends DepartmentState{

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SuccessFetchListState extends DepartmentState{
  List<DepartmentResponse> posts;
  int number;

  SuccessFetchListState(this.posts,this.number);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FailureFetchListState extends DepartmentState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}