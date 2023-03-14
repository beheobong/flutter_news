import 'package:equatable/equatable.dart';

abstract class IndiviState extends Equatable {
  @override
  List<Object?> get props => [];
}

class IndiviLoadingState extends IndiviState {}

class IndiviDataState extends IndiviState {
  final bool update;

  IndiviDataState({this.update = false});

  @override
  List<Object?> get props => [update];
}
