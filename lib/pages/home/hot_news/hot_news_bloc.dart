import 'package:care_box/core/base_manager.dart';
import 'package:care_box/pages/home/hot_news/detail_home/detail_hotnews_page.dart';
import 'package:care_box/pages/home/hot_news/hot_news_api.dart';
import 'package:care_box/pages/home/hot_news/hot_news_model.dart';
import 'package:care_box/pages/home/hot_news/view/item_hotnews_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:care_box/base/base.dart';

class HotNewsBloc extends BaseBloc
    with LoadingPresenter, BaseManager, Presenter, ListPresenter {
  HotNewsBloc(BuildContext context) : super(context);
  late HotNewsApiClient _apiClient;

  @override
  void init() {
    _apiClient = HotNewsApiClient(context);
    initList();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.init();
  }

  @override
  Future apiLoadData({required bool isFirst}) => _apiClient.hotNews(isFirst);

  @override
  Widget itemBuild(BuildContext context, int index) {
    if (index < list.length) {
      return ItemHotNewsView(
        model: list[index],
        onTap: onDetailHome,
        showBanner: index == 0 || (index + 1) % 5 == 0,
      );
    }
    return Visibility(
      visible: _apiClient.hashNextPage,
      child: loadingView(),
    );
  }

  @override
  void updateState(List datas) {
    setState();
  }

  void onDetailHome(HotNewsModel value) {
    Utils.navigatePage(
        context,
        DetailHotNewsPage(
          model: value,
        ));
  }

  @override
  void dispose() {
    onDestroy();
    super.dispose();
  }
}
