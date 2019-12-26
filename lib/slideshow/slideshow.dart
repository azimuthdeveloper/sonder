import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonder/slideshow/bloc/bloc.dart';

class SlideshowPage extends StatefulWidget {
  @override
  _SlideshowPageState createState() => _SlideshowPageState();
}

class _SlideshowPageState extends State<SlideshowPage> {
  @override
  Widget build(BuildContext context) {
    final _slideshowBloc = BlocProvider.of<SlideshowBloc>(context);
    return BlocBuilder(
      bloc: _slideshowBloc,
      builder: (BuildContext context, SlideshowState state) {
//        if (state is ImageTransitioningState) {
//          return Center(
//            child: AnimatedCrossFade(
//              duration: Duration(milliseconds: 200),
//              crossFadeState: CrossFadeState.showFirst,
//              firstChild: Image.memory(state.firstImageBytes),
//              secondChild: Image.memory(state.secondImageBytes),
//            ),
//          );
////          return AnimatedCrossFade(firstChild: Image.network(state.firstImageUri), secondChild: Image.network(state.secondImageUri),);
//        }
        if (state is ImageLoadedState) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                duration: Duration(seconds: 5),
                child: Image.memory(
                  state.imageBytes,
                  key: Key(state.imageBytes.hashCode.toString()),
                  fit: BoxFit.fitHeight,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "S O N D E R",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                offset: Offset(0.0, 0.0),
                                blurRadius: 5.0,
                                color: Colors.white),
                          ]),
                    ),
                  ),
                ),
              )
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
