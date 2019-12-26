import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  @override
  PreferencesState get initialState => InitialPreferencesState();

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
