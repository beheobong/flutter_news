import 'package:care_box/core/base_manager.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:care_box/pages/livestream/item_livestream_model.dart';
import 'package:care_box/pages/livestream/view/item_livestream_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'detail_livestream/detail_stream_page.dart';
import 'livestream_api_client.dart';

class LiveStreamBloc extends BaseBloc
    with ApiPresenter, LoadingPresenter, BaseManager, Presenter, ListPresenter {
  LiveStreamBloc(BuildContext context) : super(context);

  late LiveStreamApiClient _apiClient;

  @override
  void init() {
    _apiClient = LiveStreamApiClient(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.init();
  }

  @override
  Map<String, Function> get apiSubmits => {};

  @override
  Widget itemBuild(BuildContext context, int index) {
    if (index < list.length) {
      return ItemLiveStreamView(
        liveModel: list[index],
        onTap: onClick,
        showBanner: index == 0 || (index + 1) % 5 == 0,
      );
    }
    return super.itemBuild(context, index);
  }

  @override
  void updateState(List datas) {
    setState();
  }

  @override
  Future apiLoadData({required bool isFirst}) => _apiClient.liveStream();

  void onClick(LiveStreamModel value) {
    if (value.href == null) {
      Utils.showToast('Không tìm thấy dữ liệu');
    } else {
      Utils.navigatePage(context, DetailStreamPage(model: value));
    }
  }
}
