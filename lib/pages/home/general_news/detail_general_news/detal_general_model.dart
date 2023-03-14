import 'package:flutter/material.dart';

class DetailGeneralModel {
  bool? success;
  String? data;

  DetailGeneralModel({this.success, this.data});

  DetailGeneralModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
  }
}


class DetailGeneralModelList {
  final List list;

  DetailGeneralModelList({required this.list});

  factory DetailGeneralModelList.fromJson(List? datas) {
    List list = [];
    if (datas == null || datas.isEmpty) {
      return DetailGeneralModelList(list: list);
    }
    try {
      list = datas.map((f) => DetailGeneralModel.fromJson(f)).toList();
    } catch (e, stack) {
      debugPrint('$e $stack');
    }
    return DetailGeneralModelList(list: list);
  }
}