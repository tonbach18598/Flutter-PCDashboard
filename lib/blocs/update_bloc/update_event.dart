import 'package:equatable/equatable.dart';


abstract class UpdateEvent extends Equatable{
  const UpdateEvent();
}

class ClickUpdateInformationEvent extends UpdateEvent{
  String email;
  String phone;

  ClickUpdateInformationEvent(this.email,this.phone);

  @override
  // TODO: implement props
  List<Object> get props => null;
}