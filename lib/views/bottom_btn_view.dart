import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/helpers/util_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBtnView extends StatelessWidget with Util {
  const BottomBtnView({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppStyle.bottomBtnColor,
        ),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppStyle.headingBold16(color: AppStyle.whiteFFFFFF),
        ),
      ),
    );
  }
}
