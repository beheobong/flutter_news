import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: Styles.copyStyle(
              fontSize: AppStyle.largeTextSize,
              fontWeight: FontWeight.bold,
              color: AppStyle.black303030),
        ),
        if (onTap != null)
          GestureDetector(
              onTap: onTap,
              child: const Image(
                image: AssetImage('assets/icons/vuesax.png'),
                height: 24,
              ))
      ],
    );
  }
}
