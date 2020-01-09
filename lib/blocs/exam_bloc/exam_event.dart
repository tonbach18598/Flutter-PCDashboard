import 'package:equatable/equatable.dart';


abstract class ExamEvent extends Equatable{
  const ExamEvent();
}

class FetchListEvent extends ExamEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}