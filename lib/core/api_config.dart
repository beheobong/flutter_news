import 'dart:io';

import 'constant.dart';

class ApiConfig {
  static final String baseUrl = Constanst.isDebug
      ? Platform.isAndroid
          ? 'https://newsapi.org/v2/'
          : 'https://newsapi.org/v2/'
      : 'https://newsapi.org/v2/';

  static const String refreshToken = '';

  static const String hotNews = 'http://8.219.96.182:1990/clone/news';
  static const String indivi = "http://8.219.96.182:1990/clone";
  static const String indiviDetail = "http://8.219.96.182:1990/clone/detail";
  static const String hotNewsDetail =
      "http://8.219.96.182:1990/clone/news-detail";
  static const String detailStream =
      "http://8.219.96.182:1990/clone/live-detail";
  static const String generalNews = "http://8.219.96.182:1990/clone/news-all";
  static const String generalDetail =
      'http://8.219.96.182:1990/clone/news-all-detail';
}
