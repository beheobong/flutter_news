import 'package:care_box/core/base_manager.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:care_box/pages/indivi/detail_indivi/detail_indivi_api.dart';
import 'package:care_box/pages/indivi/detail_indivi/detail_indivi_model.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../indivi_model.dart';

class DetailIndiviBloc extends BaseBloc
    with LoadingPresenter, BaseManager, Presenter, ListPresenter {
  DetailIndiviBloc(
    BuildContext context,
    this.model,
  ) : super(context);

  final ElementInvidi model;

  late DetailIndiviApiClient _apiClient;

  @override
  void init() {
    _apiClient = DetailIndiviApiClient(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.init();
  }

  void onMailBox() {}

  @override
  Widget itemBuild(BuildContext context, int index) {
    if (index < list.length) {
      return Column(
        children: [
          const ViewBannerPage(image: 'assets/banner/bn1.jpg'),
          const SizedBox(
            height: 20,
          ),
          HtmlWidget(
            list.length == 1 ? (list[0] as DetailIndiviModel).data ?? "" : "",
            textStyle: TextStyle(color: AppStyle.textBody),
          ),
          const SizedBox(
            height: 20,
          ),
          const ViewBannerPage(image: 'assets/banner/bn1.jpg'),
        ],
      );
    }
    return super.itemBuild(context, index);
  }

  @override
  void updateState(List datas) {
    setState();
  }

  @override
  Future apiLoadData({required bool isFirst}) =>
      _apiClient.indiviDetail(model.href ?? '');

  // void onDetail(ElementInvidi value) {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => DetailIndiviPage( indivi: value)));

  @override
  void dispose() {
    onDestroy();
    return super.dispose();
  }
}
