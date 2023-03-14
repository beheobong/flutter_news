import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/themes/styles.dart';
import 'package:flutter/material.dart';

class AccountBtnLogoutView extends StatelessWidget {
  const AccountBtnLogoutView({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppStyle.redCE3737,
              image: const DecorationImage(
                  image: AssetImage('assets/icons/ic_logout.png'), scale: 2.5),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Đăng xuất',
          style: Styles.copyStyle(
            color: AppStyle.black303030,
            fontSize: AppStyle.largeTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
