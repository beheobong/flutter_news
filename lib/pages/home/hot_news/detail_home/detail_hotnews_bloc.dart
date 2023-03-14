import 'package:care_box/core/base_manager.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:care_box/pages/home/hot_news/hot_news_model.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'detail_hotnews_api.dart';
import 'detail_hotnews_model.dart';

class DetailHotNewsBloc extends BaseBloc
    with LoadingPresenter, BaseManager, Presenter, ListPresenter {
  DetailHotNewsBloc(BuildContext context, this.model) : super(context);

  final HotNewsModel model;

  late DetailHotNewsApiClient _apiClient;

  @override
  void init() {
    _apiClient = DetailHotNewsApiClient(context);
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
          const ViewBannerPage(image: 'assets/banner/bn2.jpg'),
             const SizedBox(
            height: 20,
          ),
          HtmlWidget(
            list.length == 1 ? (list[0] as DetailHotNewsModel).data ?? "" : "",
            textStyle: TextStyle(color: AppStyle.textBody),
          ),
          const SizedBox(
            height: 20,
          ),
          const ViewBannerPage(image: 'assets/banner/bn2.jpg'),
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
      _apiClient.hotNewsDetail(model.href ?? "");

  @override
  void dispose() {
    onDestroy();
    return super.dispose();
  }
}
