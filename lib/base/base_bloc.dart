import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';

class BaseBloc extends Cubit<BaseState> {
  BaseBloc(this.context) : super(InitState()) {
    init();
  }

  final BuildContext context;

  void init() {}

  void setState() {
    emit(UpdateState());
    emit(InitState());
  }

  void dispose() {}
}
