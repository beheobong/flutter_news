import 'package:flutter/material.dart';

class DetailHotNewsModel {
  bool? success;
  String? data;

  DetailHotNewsModel({this.success, this.data});

  factory DetailHotNewsModel.fromJson(Map<String, dynamic> json) {
    return DetailHotNewsModel(
      success: json['success'],
      data: json['data'],
    );
  }
}

class DetailHotNewsModelList {
  final List list;

  DetailHotNewsModelList({required this.list});

  factory DetailHotNewsModelList.fromJson(List? datas) {
    List list = [];
    if (datas == null || datas.isEmpty) {
      return DetailHotNewsModelList(list: list);
    }
    try {
      list = datas.map((f) => DetailHotNewsModel.fromJson(f)).toList();
    } catch (e, stack) {
      debugPrint('$e $stack');
    }
    return DetailHotNewsModelList(list: list);
  }
}
