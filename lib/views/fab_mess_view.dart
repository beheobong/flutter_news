import 'package:care_box/helpers/images_asset_helper.dart';
import 'package:flutter/material.dart';

class FabMessView extends StatelessWidget {
  const FabMessView({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xff1C7797), Color(0xff2891B5)],
          ),
        ),
        child: Image.asset(ImageAsset.icSmsNotification, width: 24, height: 24),
      ),
    );
  }
}
