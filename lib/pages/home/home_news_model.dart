// import 'package:flutter/material.dart';

// class HomeNewsModel {
//   String? img;
//   String? title;
//   String? subTitle;
//   String? href;

//   String get titleShow {
//     if (title != null) {
//       return title!.replaceAll("                            ", "");
//     }
//     return '';
//   }

//   HomeNewsModel({this.img, this.title, this.subTitle, this.href});

//   factory HomeNewsModel.fromJson(Map<String, dynamic> json) {
//     return HomeNewsModel(
//       img: json['img'],
//       title: json['title'],
//       subTitle: json['sub_title'],
//       href: json['href'],
//     );
//   }
// }

// class HomeNewsModelList {
//   final List<HomeNewsModel> list;

//   HomeNewsModelList({required this.list});

//   factory HomeNewsModelList.fromJson(List? datas) {
//     List<HomeNewsModel> list = [];
//     if (datas == null || datas.isEmpty) {
//       return HomeNewsModelList(list: list);
//     }
//     try {
//       list = datas.map((f) => HomeNewsModel.fromJson(f)).toList();
//     } catch (e, stack) {
//       debugPrint('$e $stack');
//     }
//     return HomeNewsModelList(list: list);
//   }
// }
