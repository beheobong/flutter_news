import 'package:care_box/core/api_client.dart';
import 'package:care_box/core/api_config.dart';
import 'package:flutter/material.dart';
import 'detail_hotnews_model.dart';

class DetailHotNewsApiClient extends ApiClient {
  DetailHotNewsApiClient(BuildContext context) : super(context);
  Future hotNewsDetail(String url) async {
    debugPrint("Call API Detail Indivi");
    final query = {
      'url': url,
    };
    // String link = "http://8.219.96.182:1990/clone?page=1";
    // final resIndivi = await api.methodGet(api: link);
    final res = await api.methodGet(
      api: ApiConfig.hotNewsDetail,
      queries: query,
    );
    debugPrint('ApiClientgetProductStatus $res');
    if (res['success'] == true) {
      return [DetailHotNewsModel.fromJson(res)];
    }
    return errorHandle(res);
  }
}
