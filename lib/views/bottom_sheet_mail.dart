import 'package:dudv_base/themes/styles.dart';
import 'package:flutter/material.dart';

import '../helpers/app_style.dart';

class BottomSheetMail extends StatelessWidget {
  final String title;
  final bool isColor;
  const BottomSheetMail({Key? key, required this.title, this.isColor = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: isColor ? AppStyle.screenBgColor : Colors.white,
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 20, 15, 40),
        decoration: BoxDecoration(
            color: isColor ? AppStyle.blue2891B5 : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppStyle.blue2891B5)),
        child: Center(
          child: Text(
            title,
            style: Styles.copyStyle(fontSize: 16, color: isColor ? Colors.white : AppStyle.blue2891B5),
          ),
        ),
      ),
    );
  }
}
