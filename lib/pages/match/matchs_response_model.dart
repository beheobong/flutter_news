import 'package:flutter/cupertino.dart';

class MatchsResponseModel {
  final Team1? team1;
  final Team1? team2;
  final String? leagueTitle;
  final String? matchHour;

  MatchsResponseModel(
      {this.team1, this.team2, this.leagueTitle, this.matchHour});

  factory MatchsResponseModel.fromJson(Map<String, dynamic> json) {
    return MatchsResponseModel(
      team1: json['team1'] != null ?  Team1.fromJson(json['team1']) : null,
      team2: json['team2'] != null ?  Team1.fromJson(json['team2']) : null,
      leagueTitle: json['league_title'],
      matchHour: json['match_hour'],
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

class MatchsResponseModelList {
  final List list;

  MatchsResponseModelList({required this.list});

  factory MatchsResponseModelList.fromJson(List? datas) {
    List list = [];
    if (datas == null || datas.isEmpty) {
      return MatchsResponseModelList(list: list);
    }
    try {
      list = datas.map((f) => MatchsResponseModel.fromJson(f)).toList();
    } catch (e, stack) {
      debugPrint('$e $stack');
    }
    return MatchsResponseModelList(list: list as List<MatchsResponseModel>);
  }
}



// class MatchsResponseModel {
//   String? status;
//   List<MatchModel>? data;

//   MatchsResponseModel({this.status, this.data});

//   MatchsResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <MatchModel>[];
//       json['data'].forEach((v) {
//         data!.add(MatchModel.fromJson(v));
//       });
//     }
//   }
// }

// class MatchModel {
//   final String? sId;
//   final int? awayScore;
//   final List<String>? awayScorers;
//   final String? awayTeamId;
//   final String? finished;
//   final String? group;
//   final int? homeScore;
//   final List<String>? homeScorers;
//   final String? homeTeamId;
//   final String? id;
//   final String? localDate;
//   final String? matchday;
//   final String? persianDate;
//   final String? stadiumId;
//   final String? timeElapsed;
//   final String? type;
//   final String? homeTeamFa;
//   final String? awayTeamFa;
//   final String? homeTeamEn;
//   final String? awayTeamEn;
//   final String? homeFlag;
//   final String? awayFlag;

//   MatchModel(
//       {this.sId,
//       this.awayScore,
//       this.awayScorers,
//       this.awayTeamId,
//       this.finished,
//       this.group,
//       this.homeScore,
//       this.homeScorers,
//       this.homeTeamId,
//       this.id,
//       this.localDate,
//       this.matchday,
//       this.persianDate,
//       this.stadiumId,
//       this.timeElapsed,
//       this.type,
//       this.homeTeamFa,
//       this.awayTeamFa,
//       this.homeTeamEn,
//       this.awayTeamEn,
//       this.homeFlag,
//       this.awayFlag});

//   // factory MatchModel.fromJson(Map<String, dynamic> json) {
//   //   return MatchsModel(
//   //      sId : json['_id'];
//   //   awayScore : json['away_score'];
//   //   awayScorers : json['away_scorers'].cast<String>();
//   //   awayTeamId : json['away_team_id'];
//   //   finished : json['finished'];
//   //   group : json['group'];
//   //   homeScore : json['home_score'];
//   //   homeScorers : json['home_scorers'].cast<String>();
//   //   homeTeamId : json['home_team_id'];
//   //   id : json['id'];
//   //   localDate : json['local_date'];
//   //   // localDate = json['local_date'];
//   //   // publishedAt: DateTime.parse(json["publishedAt"]),
//   //   matchday : json['matchday'];
//   //   persianDate : json['persian_date'];
//   //   stadiumId : json['stadium_id'];
//   //   timeElapsed : json['time_elapsed'];
//   //   type : json['type'];
//   //   homeTeamFa : json['home_team_fa'];
//   //   awayTeamFa : json['away_team_fa'];
//   //   homeTeamEn : json['home_team_en'];
//   //   awayTeamEn : json['away_team_en'];
//   //   homeFlag : json['home_flag'];
//   //   awayFlag : json['away_flag'];
//   //   );
//   // }

//   factory MatchModel.fromJson(Map<String, dynamic> json) {
//     return MatchModel(
//         sId: json['_id'],
//         awayScore: json['away_score'],
//         awayScorers: json['away_scorers'].cast<String>(),
//         awayTeamId: json['away_team_id'],
//         finished: json['finished'],
//         group: json['group'],
//         homeScore: json['home_score'],
//         homeScorers: json['home_scorers'].cast<String>(),
//         homeTeamId: json['home_team_id'],
//         id: json['id'],
//         localDate: json['local_date'],
//         // localDate = json['local_date'];
//         // publishedAt: DateTime.parse(json["publishedAt"]),
//         matchday: json['matchday'],
//         persianDate: json['persian_date'],
//         stadiumId: json['stadium_id'],
//         timeElapsed: json['time_elapsed'],
//         type: json['type'],
//         homeTeamFa: json['home_team_fa'],
//         awayTeamFa: json['away_team_fa'],
//         homeTeamEn: json['home_team_en'],
//         awayTeamEn: json['away_team_en'],
//         homeFlag: json['home_flag'],
//         awayFlag: json['away_flag']);
//   }
// }