import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class SlideshowState extends Equatable {
  const SlideshowState();
}

class InitialSlideshowState extends SlideshowState {
  @override
  List<Object> get props => [];
}

class ImageLoadedState extends SlideshowState {
  final Uint8List imageBytes;

  ImageLoadedState(this.imageBytes);

  @override
  // TODO: implement props
  List<Object> get props => [imageBytes];
}

class ImageTransitioningState extends SlideshowState {
  final Uint8List firstImageBytes;
  final Uint8List secondImageBytes;

//  final String secondImageUri;

  ImageTransitioningState(this.firstImageBytes, this.secondImageBytes);

  @override
  // TODO: implement props
  List<Object> get props => [firstImageBytes, secondImageBytes];

//  @override
//  String toString() {
//    // TODO: implement toString
//    return 'going from $firstImageUri to $secondImageUri';
//  }
}
