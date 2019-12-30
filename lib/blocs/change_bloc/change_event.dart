import 'package:equatable/equatable.dart';


abstract class ChangeEvent extends Equatable{
  const ChangeEvent();
}

class PressChangePasswordEvent extends ChangeEvent{
  String oldPassword;
  String newPassword;
  String reNewPassword;

  PressChangePasswordEvent(this.oldPassword,this.newPassword,this.reNewPassword);

  @override
  // TODO: implement props
  List<Object> get props => null;
}