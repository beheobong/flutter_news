import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends BaseState {
  @override
  String toString() => 'AuthInitState';
}


class UpdateState extends BaseState {
  @override
  String toString() => 'AuthUpdateState';
}
