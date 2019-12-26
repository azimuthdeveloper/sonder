import 'package:equatable/equatable.dart';

abstract class PreferencesState extends Equatable {
  const PreferencesState();
}

class InitialPreferencesState extends PreferencesState {
  @override
  List<Object> get props => [];
}
