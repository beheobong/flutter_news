import 'package:care_box/core/base_manager.dart';
import 'package:care_box/pages/home/general_news/detail_general_news/detail_general_page.dart';
import 'package:care_box/pages/home/general_news/general_news_api.dart';
import 'package:care_box/pages/home/general_news/general_news_model.dart';
import 'package:care_box/pages/home/general_news/view/item_generalnews_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:care_box/base/base.dart';

class GeneralNewsBloc extends BaseBloc
    with LoadingPresenter, BaseManager, Presenter, ListPresenter {
  GeneralNewsBloc(BuildContext context) : super(context);
  late GeneralNewsApiClient _apiClient;

  @override
  void init() {
    _apiClient = GeneralNewsApiClient(context);
    initList();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.init();
  }

  @override
  Future apiLoadData({required bool isFirst}) =>
      _apiClient.generalNews(isFirst);

  @override
  Widget itemBuild(BuildContext context, int index) {
    if (index < list.length) {
      return ItemGeneralNewsView(
        generalNews: list[index],
        itemGeneral: onDetail,
        showBanner: index != 0 && (index +1)%5 == 0,
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

  void onDetail(GeneralNewsModel value) {
    Utils.navigatePage(
        context,
        DetailGeneralPage(
          model: value,
        ));
  }

  @override
  void dispose() {
    onDestroy();
    super.dispose();
  }
}
