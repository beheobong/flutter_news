import 'package:care_box/helpers/app_style.dart';
import 'package:flutter/material.dart';

class FavoriteButtonView extends StatelessWidget {
  const FavoriteButtonView(
      {Key? key, required this.onTap, required this.favorited})
      : super(key: key);

  final GestureTapCallback onTap;
  final bool favorited;

  String get icon {
    if (favorited) {
      return 'assets/icons/ic_archive_tick.png';
    }
    return 'assets/icons/ic_tag.png';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppStyle.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Image(
          image: AssetImage(icon),
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
