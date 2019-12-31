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

class InitSelfState extends ClassState {
  SelfResponse self;

  InitSelfState(this.self);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessFetchListState extends ClassState {
  List<ClassResponse> posts;

  SuccessFetchListState(this.posts);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureFetchListState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapPostState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class TapCommentState extends ClassState {
  ClassResponse post;

  TapCommentState(this.post);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressMoreState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressEditState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressDeleteState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressCancelState extends ClassState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
