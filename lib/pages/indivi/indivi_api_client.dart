import 'package:care_box/core/api_client.dart';
import 'package:care_box/core/api_config.dart';
import 'package:care_box/pages/indivi/indivi_model.dart';
import 'package:flutter/material.dart';

class IndiviApiClient extends ApiClient {
  IndiviApiClient(BuildContext context) : super(context);
  // DateFormat get f => DateFormat('yyyy-MM-dd');
  

  Future indivi(bool isFirst,) async {
    if (isFirst) {
      page = 2;
      hashNextPage = true;
    }
    if (!hashNextPage) throw Exception('No more data');
    Map<String, dynamic> query = {
      'page': page,
    };
    debugPrint('ApiLoadMore $query');
    page += 1;
     final res = await api.methodGet(
      api: ApiConfig.indivi,
      queries: query,
    );
    debugPrint('ApiClientgetProductStatus $res');
    if (res['success']) {
      final list = IndiviModelList.fromJson(res['data']["list"]).list;
      if (list.length < res['data']['length']) {
        hashNextPage = false;
      }
      return list;
    }
    return errorHandle(res);
  }
}
