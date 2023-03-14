import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainLoadingState extends MainState {}

class MainDataState extends MainState {
  final int? value;

  MainDataState({this.value});

  @override
  List<Object?> get props => [value];
}
