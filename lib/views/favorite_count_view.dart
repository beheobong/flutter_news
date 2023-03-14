import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class FavoriteCountView extends StatelessWidget {
  const FavoriteCountView({Key? key, required this.value})
      : super(key: key);

  final int? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/icons/ic_favorite.png'),
          width: 24,
          height: 24,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '${value ?? 0}',
          style: Styles.copyStyle(
            fontSize: 16,
            color: AppStyle.black303030,
          ),
        ),
      ],
    );
  }
}
