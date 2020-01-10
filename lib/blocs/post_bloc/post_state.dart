import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';

abstract class PostState extends Equatable{
  const PostState();
}

class InitialPostState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadingState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class InitializeSelfState extends PostState{
  SelfResponse self;

  InitializeSelfState(this.self);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPressPostState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePressPostState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPressPostState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessTapImageState extends PostState{
  File image;

  SuccessTapImageState(this.image);

  @override
  // TODO: implement props
  List<Object> get props => null;
}