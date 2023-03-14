import 'package:care_box/core/app_util.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class TimeView extends StatelessWidget {
  const TimeView({Key? key, required this.value}) : super(key: key);

  final int? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Image(
          image: AssetImage('assets/icons/ic_clock.png'),
          width: 24,
          height: 24,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '${AppUtils.formatTime(value ?? 0)} phút',
          style: Styles.copyStyle(
            fontSize: 16,
            color: AppStyle.black303030,
          ),
        ),
      ],
    );
  }
}
