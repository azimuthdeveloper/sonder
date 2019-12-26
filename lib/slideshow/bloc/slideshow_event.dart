import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class SlideshowEvent extends Equatable {
  const SlideshowEvent();
}

class InitEvent extends SlideshowEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ChangePictureEvent extends SlideshowEvent {
  final Uint8List currentPictureBytes;
//  final String currentPicture;

  ChangePictureEvent(this.currentPictureBytes);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartSlideshowEvent extends SlideshowEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PauseSlideshowEvent extends SlideshowEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
