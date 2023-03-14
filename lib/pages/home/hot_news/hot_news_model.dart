import 'package:flutter/material.dart';

class HotNewsModel {
  String? img;
  String? title;
  String? subTitle;
  String? href;

  String get titleShow {
    if (title != null) {
      return title!.replaceAll("                            ", "");
    }
    return '';
  }

  HotNewsModel({this.img, this.title, this.subTitle, this.href});

  factory HotNewsModel.fromJson(Map<String, dynamic> json) {
    return HotNewsModel(
      img: json['img'],
      title: json['title'],
      subTitle: json['sub_title'],
      href: json['href'],
    );
  }
}

class HotNewsModelList {
  final List<HotNewsModel> list;

  HotNewsModelList({required this.list});

  factory HotNewsModelList.fromJson(List? datas) {
    List<HotNewsModel> list = [];
    if (datas == null || datas.isEmpty) {
      return HotNewsModelList(list: list);
    }
    try {
      list = datas.map((f) => HotNewsModel.fromJson(f)).toList();
    } catch (e, stack) {
      debugPrint('$e $stack');
    }
    return HotNewsModelList(list: list);
  }
}
