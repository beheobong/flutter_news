import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/themes/styles.dart';
import 'package:flutter/material.dart';

class AccountItemView extends StatelessWidget {
  const AccountItemView({
    Key? key,
    this.icon,
    this.title,
    this.subTitle,
    this.isPrimary = false,
    this.onPressed,
  }) : super(key: key);
  final String? icon;
  final String? title;
  final String? subTitle;
  final bool isPrimary;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(icon!), scale: 2.5),
                borderRadius: BorderRadius.circular(12),
                color: AppStyle.whiteFFFFFF,
                border: Border.all(
                    color: isPrimary ? AppStyle.blue2891B5 : AppStyle.greyE9),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    style: Styles.copyStyle(
                      color: AppStyle.black303030,
                      fontSize: AppStyle.largeTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subTitle!,
                    style: Styles.copyStyle(
                      color: AppStyle.black303030.withOpacity(0.5),
                      fontSize: AppStyle.smallTextSize,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/icons/ic_arrow_right.png',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
