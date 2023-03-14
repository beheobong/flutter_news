import 'package:flutter/material.dart';

class GeneralNewsModel {
  String? img;
  String? title;
  String? subTitle;
  String? href;
  String? time;

  String get titleShow {
    if (title != null) {
      return title!.replaceAll("                            ", "");
    }
    return '';
  }

  GeneralNewsModel({
    this.img,
    this.title,
    this.subTitle,
    this.href,
    this.time,
  });

  factory GeneralNewsModel.fromJson(Map<String, dynamic> json) {
    return GeneralNewsModel(
      img: json['img'],
      title: json['title'],
      subTitle: json['sub_title'],
      href: json['href'],
      time: json['time'],
    );
  }
}

class GeneralNewsModelList {
  final List list;

  GeneralNewsModelList({required this.list});

  factory GeneralNewsModelList.fromJson(List? datas) {
    List list = [];
    if (datas == null || datas.isEmpty) {
      return GeneralNewsModelList(list: list);
    }
    try {
      list = datas.map((f) => GeneralNewsModel.fromJson(f)).toList();
    } catch (e, stack) {
      debugPrint('$e $stack');
    }
    return GeneralNewsModelList(list: list);
  }
}
