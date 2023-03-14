import 'package:care_box/core/base_manager.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:care_box/base/base.dart';

class HomeBloc extends BaseBloc
    with LoadingPresenter, BaseManager, Presenter, ListPresenter {
  HomeBloc(BuildContext context) : super(context);
  // late HomeApiClient _apiClient;

  @override
  void init() {
    // _apiClient = HomeApiClient(context);
    initList();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.init();
  }

  @override
  // Future apiLoadData({required bool isFirst}) => _apiClient.home(isFirst);

  @override
  Widget itemBuild(BuildContext context, int index) {
    if (index < list.length) {
      // return ItemHomeView(
      // model: list[index],
      // onTap: onDetailHome,
      // );
    }
    return Visibility(
      // visible: _apiClient.hashNextPage,
      child: loadingView(),
    );
  }

  @override
  void updateState(List datas) {
    setState();
  }

  // void onDetailHome(HotNewsModel value) {
  //   Utils.navigatePage(
  //       context,
  //       DetailHomePage(
  //         model: value,
  //       ));
  // }

  @override
  void dispose() {
    onDestroy();
    super.dispose();
  }

 
}
