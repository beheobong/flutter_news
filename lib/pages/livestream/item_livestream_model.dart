import 'package:flutter/cupertino.dart';

class LiveStreamModel {
  final Team1? team1;
  final Team1? team2;
  final String? href;
  final String? status;
  final String? tVsNum;
  final String? matchesStatus;

  String get title {
    return '${team1?.title} - ${team2?.title}';
  }

  LiveStreamModel(
      {this.team1,
      this.team2,
      this.href,
      this.status,
      this.tVsNum,
      this.matchesStatus});

  factory LiveStreamModel.fromJson(Map<String, dynamic> json) {
    return LiveStreamModel(
      team1: json['team1'] != null ? Team1.fromJson(json['team1']) : null,
      team2: json['team2'] != null ? Team1.fromJson(json['team2']) : null,
      href: json['href'],
      status: json['status'],
      tVsNum: json['t_vs_num'],
      matchesStatus: json['matches_status'],
    );
  }
}

class Team1 {
  String? title;
  String? logo;

  Team1({this.title, this.logo});

  Team1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    logo = json['logo'];
  }
}

class LiveStreamModelList {
  final List list;

  LiveStreamModelList({required this.list});

  factory LiveStreamModelList.fromJson(List? datas) {
    List list = [];
    if (datas == null || datas.isEmpty) {
      return LiveStreamModelList(list: list);
    }
    try {
      list = datas.map((f) => LiveStreamModel.fromJson(f)).toList();
    } catch (e, stack) {
      debugPrint('$e $stack');
    }
    return LiveStreamModelList(list: list as List<LiveStreamModel>);
  }
}
