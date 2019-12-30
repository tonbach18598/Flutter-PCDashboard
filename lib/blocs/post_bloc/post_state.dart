import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable{
  const PostState();
}

class InitialPostState extends PostState{
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