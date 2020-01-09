import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/exam_response.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';

abstract class ExamState extends Equatable{
  const ExamState();
}

class InitialExamState extends ExamState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadingState extends ExamState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SuccessFetchListState extends ExamState{
  List<ExamResponse> exams;

  SuccessFetchListState(this.exams);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FailureFetchListState extends ExamState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}