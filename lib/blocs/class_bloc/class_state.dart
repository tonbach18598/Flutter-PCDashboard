import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';

abstract class ClassState extends Equatable {
  const ClassState();
}

class InitialClassState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadingState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitializeSelfState extends ClassState {
  SelfResponse self;

  InitializeSelfState(this.self);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessFetchListState extends ClassState {
  List<ClassResponse> posts;
  int number;

  SuccessFetchListState(this.posts,this.number);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureFetchListState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapPostState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapCommentState extends ClassState {
  ClassResponse post;

  SuccessTapCommentState(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessPressMoreState extends ClassState {
  ClassResponse post;

  SuccessPressMoreState(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessPressEditState extends ClassState {
  ClassResponse post;

  SuccessPressEditState(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressEditState extends ClassState {

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessPressDeleteState extends ClassState {
  ClassResponse post;

  SuccessPressDeleteState(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressDeleteState extends ClassState {

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessPressCancelState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
