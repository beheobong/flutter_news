import 'package:flutter/material.dart';

import 'api.dart';

abstract class ApiClient {
  final int limit = 40;
  final BuildContext contex;
  late Api api;

  ApiClient(this.contex) {
    init();
  }

  void init() async {
    api = Api(contex);
  }

  int page = 0;
  bool hashNextPage = true;
  Future errorHandle(Map<String, dynamic> res) async {
    if (res.containsKey('message') && res['message'] != null) {
      throw BaseException(res['message']);
    }
    throw BaseException('Something was wrong');
  }
}

class BaseException implements Exception {
  final dynamic message;

  BaseException([this.message]);

  @override
  String toString() {
    String value = 'Exception';
    if (message == null) return value;
    return message;
  }
}
