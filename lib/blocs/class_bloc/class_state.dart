import 'package:equatable/equatable.dart';

abstract class ClassState extends Equatable{
  const ClassState();
}

class InitialClassState extends ClassState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class ClickPostState extends ClassState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}