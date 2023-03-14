import 'package:care_box/helpers/app_style.dart';
import 'package:flutter/material.dart';

class BackButtonView extends StatelessWidget {
  const BackButtonView({Key? key, this.onTap}) : super(key: key);

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 12, right: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppStyle.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.arrow_back_ios, size: 24, color: Colors.black),
      ),
    );
  }
}
