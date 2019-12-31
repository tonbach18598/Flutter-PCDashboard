import 'package:equatable/equatable.dart';


abstract class UpdateEvent extends Equatable{
  const UpdateEvent();
}

class InitializeSelfEvent extends UpdateEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressConfirmEvent extends UpdateEvent{

  String email;
  String phone;

  PressConfirmEvent(this.email,this.phone);

  @override
  // TODO: implement props
  List<Object> get props => null;
}