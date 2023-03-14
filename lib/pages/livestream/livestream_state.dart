import 'package:equatable/equatable.dart';

abstract class LiveStreamState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LiveStreamLoadingState extends LiveStreamState {}

class LiveStreamDataState extends LiveStreamState {
  final bool update;

  LiveStreamDataState({this.update = false});

  @override
  List<Object?> get props => [update];
}
