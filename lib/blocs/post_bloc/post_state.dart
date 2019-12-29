import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable{
  const PostState();
}

class InitialPostState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessPostState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailurePostState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WarningPostState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}