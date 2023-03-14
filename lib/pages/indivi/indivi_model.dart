import 'package:flutter/material.dart';
export 'indivi_bloc.dart';

class IndiviModel {
  bool? success;
  Data? data;

  IndiviModel({this.success, this.data});

  factory IndiviModel.fromJson(Map<String, dynamic> json) {
    return IndiviModel(
        success: json['success'],
        data: (json['data'] != null ? Data.fromJson(json['data']) : null));
  }
}

class Data {
  List<ElementInvidi>? list;
  int? length;

  Data({this.list, this.length});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ElementInvidi>[];
      json['list'].forEach((v) {
        list!.add(ElementInvidi.fromJson(v));
      });
    }
    length = json['length'];
  }
}

class ElementInvidi {
  String? img;
  String? a;
  String? href;

  ElementInvidi({this.img, this.a, this.href});

  ElementInvidi.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    a = json['a'];
    href = json['href'];
  }
}

class IndiviModelList {
  final List<ElementInvidi> list;

  IndiviModelList({required this.list});

  factory IndiviModelList.fromJson(List? datas) {
    List<ElementInvidi> list = [];
    if (datas == null || datas.isEmpty) {
      return IndiviModelList(list: list);
    }
    try {
      list = datas.map((f) => ElementInvidi.fromJson(f)).toList();
    } catch (e, stack) {
      debugPrint('$e $stack');
    }
    return IndiviModelList(list: list);
  }
}




// class IndiviModel {
//     IndiviModel({
//         required this.success,
//         required this.data,
//     });

//     final bool? success;
//     final Data? data;

//     factory IndiviModel.fromJson(Map<String, dynamic> json){ 
//         return IndiviModel(
//         success: json["success"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );
//     }

// }

// class Data {
//     Data({
//         required this.list,
//         required this.length,
//     });

//     final List<ListElement> list;
//     final int? length;

//     factory Data.fromJson(Map<String, dynamic> json){ 
//         return Data(
//         list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
//         length: json["length"],
//     );
//     }

// }

// class ListElement {
//     ListElement({
//         required this.img,
//         required this.a,
//         required this.href,
//     });

//     final String? img;
//     final String? a;
//     final String? href;

//     factory ListElement.fromJson(Map<String, dynamic> json){ 
//         return ListElement(
//         img: json["img"],
//         a: json["a"],
//         href: json["href"],
//     );
//     }

// }

// class IndiviModelList {
//   final List list;

//   IndiviModelList({required this.list});

//   factory IndiviModelList.fromJson(List? datas) {
//     List list = [];
//     if (datas == null || datas.isEmpty) {
//       return IndiviModelList(list: list);
//     }
//     try {
//       list = datas.map((f) => IndiviModel.fromJson(f)).toList();
//     } catch (e, stack) {
//       debugPrint('$e $stack');
//     }
//     return IndiviModelList(list: list as List<IndiviModel>);
//   }
// }

