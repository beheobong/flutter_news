import 'package:flutter/material.dart';

class CloseBtnView extends StatelessWidget {
  const CloseBtnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(6),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: const Icon(Icons.close, size: 20),
      ),
    );
  }
}
