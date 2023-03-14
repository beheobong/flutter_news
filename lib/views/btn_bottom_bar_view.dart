import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/themes/styles.dart';
import 'package:flutter/material.dart';

class BtnBottomBarView extends StatelessWidget {
  const BtnBottomBarView({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppStyle.blue2891B5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppStyle.blue2891B5),
        ),
        child: Text(
          text,
          style: Styles.copyStyle(fontSize: 16, color: AppStyle.whiteFFFFFF),
        ),
      ),
    );
  }
}
