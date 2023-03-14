import 'package:care_box/core/base_manager.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/general_news/detail_general_news/detail_general_api.dart';
import 'package:care_box/pages/home/general_news/detail_general_news/detal_general_model.dart';
import 'package:care_box/pages/home/general_news/general_news_model.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailGeneralBloc extends BaseBloc
    with LoadingPresenter, BaseManager, Presenter, ListPresenter {
  DetailGeneralBloc(BuildContext context, this.model) : super(context);

  final GeneralNewsModel model;

  late DetailGeneralApiClient _apiClient;

  @override
  void init() {
    _apiClient = DetailGeneralApiClient(context);
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
          const ViewBannerPage(image: 'assets/banner/bn6.jpg'),
             const SizedBox(
            height: 20,
          ),
          HtmlWidget(
            list.length == 1 ? (list[0] as DetailGeneralModel).data ?? "" : "",
            textStyle: TextStyle(color: AppStyle.textBody),
          ),
          const SizedBox(
            height: 20,
          ),
          const ViewBannerPage(image: 'assets/banner/bn6.jpg')
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
      _apiClient.generalDetail(model.href ?? "");

  @override
  void dispose() {
    onDestroy();
    return super.dispose();
  }
}
