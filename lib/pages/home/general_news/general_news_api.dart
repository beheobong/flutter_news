import 'package:care_box/core/api_client.dart';
import 'package:care_box/core/api_config.dart';
import 'package:care_box/pages/home/general_news/general_news_model.dart';
import 'package:flutter/material.dart';

class GeneralNewsApiClient extends ApiClient {
  GeneralNewsApiClient(BuildContext context) : super(context);

  Future generalNews(
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
      api: ApiConfig.generalNews,
      queries: query,
    );
    debugPrint('ApiClientgetProductStatus $res');
    if (res['success']) {
      final list = GeneralNewsModelList.fromJson(res["data"]).list;
      if (list.length < 16) {
        hashNextPage = false;
      }
      return list;
    }
    return errorHandle(res);
  }
}
