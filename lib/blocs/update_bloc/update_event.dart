import 'package:equatable/equatable.dart';


abstract class UpdateEvent extends Equatable{
  const UpdateEvent();
}

class PressUpdateInformationEvent extends UpdateEvent{
  String email;
  String phone;

  PressUpdateInformationEvent(this.email,this.phone);

  @override
  // TODO: implement props
  List<Object> get props => null;
}