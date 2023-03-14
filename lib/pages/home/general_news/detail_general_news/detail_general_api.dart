import 'package:care_box/core/api_client.dart';
import 'package:care_box/core/api_config.dart';
import 'package:care_box/pages/home/general_news/detail_general_news/detal_general_model.dart';
import 'package:flutter/material.dart';


class DetailGeneralApiClient extends ApiClient {
  DetailGeneralApiClient(BuildContext context) : super(context);
  Future generalDetail(String url) async {
    debugPrint("Call API Detail General News");
    final query = {
      'url': url,
    };
    // String link = "http://8.219.96.182:1990/clone?page=1";
    // final resIndivi = await api.methodGet(api: link);
    final res = await api.methodGet(
      api: ApiConfig.generalDetail,
      queries: query,
    );
    debugPrint('ApiClientgetProductStatus $res');
    if (res['success'] == true) {
      return [DetailGeneralModel.fromJson(res)];
    }
    return errorHandle(res);
  }
}
