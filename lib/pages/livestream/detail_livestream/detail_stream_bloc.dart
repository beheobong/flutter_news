import 'package:care_box/core/base_manager.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../item_livestream_model.dart';
import 'detail_stream_api.dart';

class DetailStreamBloc extends BaseBloc
    with ApiPresenter, LoadingPresenter, BaseManager, Presenter {
  DetailStreamBloc(BuildContext context, this.model) : super(context);

  late DetailStreamApiClient _apiClient;
  String? urlStream;
  final String _loadDetail = '_loadDetail';
  final LiveStreamModel model;

  @override
  void init() {
    _apiClient = DetailStreamApiClient(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.init();
  }

  @override
  Future loadData() async {
    urlStream = await onSubmit(_loadDetail, loading: false);
    // if (urlStream != null) {
    //   controller = VideoPlayerController.network(urlStream!, formatHint: VideoFormat.ss);
    //   controller!.addListener(() {
    //     setState();
    //   });
    //   controller!.initialize();
    // }
    setState();
  }

  Future getStream() => _apiClient.detailStream(model.href);

  @override
  Map<String, Function> get apiSubmits => {_loadDetail: getStream};

  
}
