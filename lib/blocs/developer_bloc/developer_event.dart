import 'package:equatable/equatable.dart';


abstract class DeveloperEvent extends Equatable{
  const DeveloperEvent();
}

class PressSendEvent extends DeveloperEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}