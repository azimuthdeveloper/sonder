import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import './bloc.dart';

class SlideshowBloc extends Bloc<SlideshowEvent, SlideshowState> {
//  String currentImage;
  Uint8List currentImageBytes;

  final http.Client _http = http.Client();

  Timer timer;
  @override
  SlideshowState get initialState => InitialSlideshowState();

  @override
  Stream<SlideshowState> mapEventToState(
    SlideshowEvent event,
  ) async* {
    if (event is InitEvent) {
      timer?.cancel();
      add(StartSlideshowEvent());
    }
    if (event is StartSlideshowEvent) {
      _startTimer();
//      timer = Timer.periodic(Duration(seconds: 5), (time) {});
    }
    if (event is PauseSlideshowEvent) {
      _stopTimer();
    }
    if (event is ChangePictureEvent) {
      final nextPicture = await _getRandomPictureUri();
      final nextPictureResponse = await _http.get(nextPicture);
      yield ImageLoadedState(nextPictureResponse.bodyBytes);
//      if (currentImageBytes == null) {
//        final startingImage = await rootBundle.load('assets/initial.jpg');
//        currentImageBytes = startingImage.buffer.asUint8List();
////        currentImageBytes = (await rootBundle.load('assets/initial.jpg')).
//      }

//
////      final nextPicture = await _getRandomPictureUri();
////      final picture = await _http.get(nextPicture);
//
////      final currentPicture = event.
//      yield (ImageTransitioningState(
//          currentImageBytes, nextPictureResponse.bodyBytes));
//      currentImageBytes = nextPictureResponse.bodyBytes;
    }
    // TODO: Add Logic
  }

  _startTimer() {
    timer = Timer.periodic(Duration(seconds: 30), (timer) {
      add(ChangePictureEvent(currentImageBytes));
    });
  }

  _stopTimer() {
    timer?.cancel();
  }

  Future<String> _getRandomPictureUri() async {
    final request = http.Request(
        'GET',
        Uri.parse(
            "https://source.unsplash.com/random/1920x1080/?relaxing,tranquil"))
      ..followRedirects = false;

    final response = await _http.send(request);
    print(response.headers['location']);
    return response.headers['location'];
  }
}
