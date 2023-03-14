import 'package:care_box/core/base_manager.dart';
import 'package:dudv_base/api_presenter.dart';
import 'package:dudv_base/loading_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainBloc extends Cubit<MainState>
    with ApiPresenter, LoadingPresenter, BaseManager {
  MainBloc(this.context) : super(MainLoadingState());

  @override
  final BuildContext context;

  final pageController = PageController();
  int currentIndex = 0;

  @override
  Map<String, Function> get apiSubmits => {};

  void changePage(int value) {
    currentIndex = value;
    pageController.jumpToPage(value);
    emit(MainDataState(value: value));
  }

  void closeDialog() {
    Navigator.pop(context);
  }
}
