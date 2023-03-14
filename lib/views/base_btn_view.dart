import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/helpers/util_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseBtnView extends StatelessWidget with Util {
  const BaseBtnView({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color,
    this.margin,
  }) : super(key: key);

  final void Function() onPressed;
  final String title;
  final Color? color;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: margin ?? const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(12),
          color: color ?? AppStyle.bottomBtnColor,
        ),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppStyle.headingBold16(
            color: AppStyle.whiteFFFFFF,
          ),
        ),
      ),
    );
  }
}
