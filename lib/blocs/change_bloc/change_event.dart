import 'package:equatable/equatable.dart';


abstract class ChangeEvent extends Equatable{
  const ChangeEvent();
}

class PressConfirmEvent extends ChangeEvent{
  String oldPassword;
  String newPassword;
  String retypePassword;

  PressConfirmEvent(this.oldPassword,this.newPassword,this.retypePassword);

  @override
  // TODO: implement props
  List<Object> get props => null;
}