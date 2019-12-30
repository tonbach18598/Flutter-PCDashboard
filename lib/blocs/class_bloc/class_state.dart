import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';

abstract class ClassState extends Equatable{
  const ClassState();
}

class InitialClassState extends ClassState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadingState extends ClassState{

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SuccessFetchListState extends ClassState{
  List<ClassResponse> posts;
  SuccessFetchListState(this.posts);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureFetchListState extends ClassState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapPostState extends ClassState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}