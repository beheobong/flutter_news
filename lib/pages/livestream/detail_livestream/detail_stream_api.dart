import 'package:care_box/core/api_client.dart';
import 'package:flutter/material.dart';
import 'package:care_box/core/api_config.dart';
class DetailStreamApiClient extends ApiClient {
  DetailStreamApiClient(BuildContext context) : super(context);

  Future detailStream(String? urlStream) async {
    final query = {
      'url': urlStream,
    };
    final res = await api.methodGet(
      api: ApiConfig.detailStream,
      queries: query,
    );
    debugPrint('ApiClientgetProductStatus $res');
    if (res['success']) {
      return res['data'];
    }
    return errorHandle(res);
  }
}


