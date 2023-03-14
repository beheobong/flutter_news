import 'package:flutter/material.dart';

class DetailIndiviModel {
  bool? success;
  String? data;

  DetailIndiviModel({this.success, this.data});

  factory DetailIndiviModel.fromJson(Map<String, dynamic> json) {
    return DetailIndiviModel(
      success: json['success'],
      data: json['data'],
    );
  }
}

class DetailModelList {
  final List list;

  DetailModelList({required this.list});

  factory DetailModelList.fromJson(List? datas) {
    List list = [];
    if (datas == null || datas.isEmpty) {
      return DetailModelList(list: list);
    }
    try {
      list = datas.map((f) => DetailIndiviModel.fromJson(f)).toList();
    } catch (e, stack) {
      debugPrint('$e $stack');
    }
    return DetailModelList(list: list);
  }
}
