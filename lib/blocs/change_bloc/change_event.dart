import 'package:equatable/equatable.dart';


abstract class ChangeEvent extends Equatable{
  const ChangeEvent();
}

class ClickChangePasswordEvent extends ChangeEvent{
  String oldPassword;
  String reOldPassword;
  String newPassword;

  ClickChangePasswordEvent(this.oldPassword,this.reOldPassword,this.newPassword);

  @override
  // TODO: implement props
  List<Object> get props => null;
}