import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitState extends AuthState {
  @override
  String toString() => 'AuthInitState';
}


class AuthUpdateState extends AuthState {
  @override
  String toString() => 'AuthUpdateState';
}
