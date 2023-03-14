import 'package:care_box/core/api_client.dart';
import 'package:care_box/core/api_config.dart';
import 'package:care_box/pages/home/hot_news/hot_news_model.dart';
import 'package:flutter/material.dart';

class HotNewsApiClient extends ApiClient {
  HotNewsApiClient(BuildContext context) : super(context);
  // DateFormat get f => DateFormat('yyyy-MM-dd');

  Future hotNews(
    bool isFirst,
  ) async {
    if (isFirst) {
      page = 1;
      hashNextPage = true;
    }
    if (!hashNextPage) throw Exception('No more data');
    Map<String, dynamic> query = {
      'page': page,
    };
    debugPrint('ApiLoadMore $query');
    page += 1;
    final res = await api.methodGet(
      api: ApiConfig.hotNews,
      queries: query,
    );
    debugPrint('ApiClientgetProductStatus $res');
    if (res['success']) {
      final list = HotNewsModelList.fromJson(res["data"]).list;
      if (list.length < 17) {
        hashNextPage = false;
      }
      return list;
    }
    return errorHandle(res);
  }
}
