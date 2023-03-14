import 'package:care_box/core/base_manager.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:care_box/pages/indivi/indivi_api_client.dart';
import 'package:care_box/pages/indivi/indivi_model.dart';
import 'package:care_box/pages/indivi/view/item_indivi_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

import 'detail_indivi/deltail_indivi_page.dart';

class IndiviBloc extends BaseBloc
    with LoadingPresenter, BaseManager, Presenter, ListPresenter {
  IndiviBloc(
    BuildContext context,
  ) : super(context);

  late IndiviApiClient _apiClient;

  @override
  void init() {
    _apiClient = IndiviApiClient(context);
    initList();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.init();
  }

  @override
  Widget itemBuild(BuildContext context, int index) {
    if (index < list.length) {
      return ItemIndiviView(
        indivi: list[index],
        onTapToDetail: onDetail,
        showBanner: index != 0 && (index + 1)%5 ==0,
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

  @override
  Future apiLoadData({required bool isFirst}) => _apiClient.indivi(isFirst);

  void onDetail(ElementInvidi value) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailIndiviPage(model: value)),
    );
  }

  @override
  void dispose() {
    onDestroy();
    return super.dispose();
  }
}
