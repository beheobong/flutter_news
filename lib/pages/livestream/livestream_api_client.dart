import 'package:care_box/core/api_client.dart';
import 'package:care_box/pages/livestream/item_livestream_model.dart';
import 'package:flutter/material.dart';

class LiveStreamApiClient extends ApiClient {
  LiveStreamApiClient(BuildContext contex) : super(contex);

  Future liveStream() async {
    // final query = {
    //   'q': 'th%E1%BB%83%20thao',
    //   'from': f.format(DateTime.now().subtract(const Duration(days: 31))),
    //   'sortBy': 'publishedAt',
    //   'apiKey': '4ae78fa070d34ae9b026256945b26038',
    // };
    String link = "http://8.219.96.182:1990/clone/live";
    final res = await api.methodGet(api: link);
    // final res = await api.methodGet(api: ApiConfig.home, queries: query,);
    if (res['success'] == true) {
      return LiveStreamModelList.fromJson(res['data']).list;
    }
    return errorHandle(res);
  }
}
