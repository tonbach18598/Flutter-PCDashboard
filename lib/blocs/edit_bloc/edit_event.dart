import 'package:equatable/equatable.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';


abstract class EditEvent extends Equatable{
  const EditEvent();
}

class InitializeSelfEvent extends EditEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressEditEvent extends EditEvent{
  ClassResponse post;
  String newContent;

  PressEditEvent(this.post,this.newContent);

  @override
  // TODO: implement props
  List<Object> get props => null;
}