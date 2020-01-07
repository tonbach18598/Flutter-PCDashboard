import 'dart:io';

import 'package:equatable/equatable.dart';


abstract class PostEvent extends Equatable{
  const PostEvent();
}

class InitializeSelfEvent extends PostEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PressPostEvent extends PostEvent{
  String content;
  File image;

  PressPostEvent(this.content,this.image);

  @override
  // TODO: implement props
  List<Object> get props => null;
}


class TapImageEvent extends PostEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}