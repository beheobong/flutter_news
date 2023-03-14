import 'dart:async';
import 'package:care_box/helpers/app_style.dart';
import 'package:flutter/material.dart';

class TimeAgo extends StatefulWidget {
  final String createdTime;

  const TimeAgo({Key? key, required this.createdTime}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimeAgoState();
}

class _TimeAgoState extends State<TimeAgo> {
  String time = '';

  @override
  void initState() {
    time = _timeAgo(widget.createdTime);
    Timer.periodic(const Duration(seconds: 1), (t) {
      if (mounted) {
        setState(() {
          time = _timeAgo(widget.createdTime);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(time,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppStyle.black1));
  }

  String _timeAgo(
    String createdTime,
  ) {
    final DateTime notificationDate = DateTime.parse(createdTime);
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);
    final totalDay = difference.inDays;
    final totalHours = difference.inHours;
    final totalMinutes = difference.inMinutes;

    if ((difference.inDays / 356).floor() >= 1) {
      return '${(totalDay / 365).floor()} năm trước';
    } else if ((totalDay / 30).floor() >= 1) {
      return '${(totalDay / 30).floor()} tháng trước';
    } else if ((totalDay / 7).floor() >= 1) {
      return '${(totalDay / 7).floor()} tuần trước';
    } else if (totalDay >= 1) {
      return '$totalDay ngày trước';
    } else if (totalHours >= 1) {
      return '$totalHours giờ trước';
    } else if (totalMinutes >= 1) {
      return '$totalMinutes phút trước';
    }
    return 'Vừa xong';
  }
}
