import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/themes/styles.dart';
import 'package:flutter/material.dart';

class CopyWithView extends StatelessWidget {
  const CopyWithView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Text(
          '©2022 CareBOX | Hưng Thịnh Corp',
          style: Styles.copyStyle(
            color: AppStyle.black303030.withOpacity(0.4),
            fontSize: AppStyle.largeTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'Directed by VietIdea Co. ltd',
          style: Styles.copyStyle(
            color: AppStyle.black303030.withOpacity(0.4),
            fontSize: AppStyle.smallTextSize,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Desigend by Williens.com',
          style: Styles.copyStyle(
            color: AppStyle.black303030.withOpacity(0.4),
            fontSize: AppStyle.smallTextSize,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
