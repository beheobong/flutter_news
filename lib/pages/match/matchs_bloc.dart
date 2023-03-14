import 'package:care_box/core/base_manager.dart';
import 'package:care_box/pages/match/matchs_api_client.dart';
import 'package:care_box/pages/match/view/item_matchs_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:care_box/base/base.dart';

class MatchsBloc extends BaseBloc
    with LoadingPresenter, BaseManager, Presenter, ListPresenter {
  MatchsBloc(BuildContext context) : super(context);
  late MatchsApiClient _apiClient;

  @override
  void init() {
    _apiClient = MatchsApiClient(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.init();
  }

  @override
  Future apiLoadData({required bool isFirst}) => _apiClient.matchs();

  @override
  Widget itemBuild(BuildContext context, int index) {
    if (index < list.length) {
      return ItemMatchsView(
        matchs: list[index],
        showBanner: index == 0 || (index + 1)%5 == 0,
      );
    }
    return super.itemBuild(context, index);
  }

  @override
  void updateState(List datas) {
    setState();
  }

  // void onDetail(HomeNewsModel value) {
  //   // Navigator.push(context,
  //   //     MaterialPageRoute(builder: (context) => DetailsHomePage(news: value)));
  // }
}
