import 'package:flutter/material.dart';

class AppUtils {
 
  static String formatTime(int seconds) {
    var value = '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
    if (value.startsWith('00:')) {
      value = value.replaceFirst('00:', '');
    }
    return value;
  }

  static gotoRoot(BuildContext context){
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static String getDayOfWeek(int day){
    if(day == 1) return 'Thứ hai';
    if(day == 1) return 'Thứ ba';
    if(day == 1) return 'Thứ tư';
    if(day == 1) return 'Thứ năm';
    if(day == 1) return 'Thứ sáu';
    if(day == 1) return 'Thứ bảy';
    return 'Chủ nhật';
  }
}
