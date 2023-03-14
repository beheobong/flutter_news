import 'package:flutter/material.dart';

class AccountBtnView extends StatelessWidget {
  const AccountBtnView({Key? key, this.icon, this.onPressed}) : super(key: key);
  final String? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        icon!,
        width: 40,
        height: 40,
      ),
    );
  }
}
