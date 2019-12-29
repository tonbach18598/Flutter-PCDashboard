import 'package:equatable/equatable.dart';


abstract class PostEvent extends Equatable{
  const PostEvent();
}

class ClickPostEvent extends PostEvent{
  String content;

  ClickPostEvent(this.content);

  @override
  // TODO: implement props
  List<Object> get props => null;
}