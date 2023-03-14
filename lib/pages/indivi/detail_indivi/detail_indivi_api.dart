import 'package:care_box/core/api_client.dart';
import 'package:care_box/core/api_config.dart';
import 'package:care_box/pages/indivi/detail_indivi/detail_indivi_model.dart';
import 'package:flutter/material.dart';

class DetailIndiviApiClient extends ApiClient {
  DetailIndiviApiClient(BuildContext context) : super(context);
  Future indiviDetail(String url) async {
    debugPrint("Call API Detail Indivi");
    final query = {
      'url': url,
    };
    // String link = "http://8.219.96.182:1990/clone?page=1";
    // final resIndivi = await api.methodGet(api: link);
    final res = await api.methodGet(
      api: ApiConfig.indiviDetail,
      queries: query,
    );
    debugPrint('ApiClientgetProductStatus $res');
    if (res['success'] == true) {
      return [DetailIndiviModel.fromJson(res)];
    }
    return errorHandle(res);
  }
}
