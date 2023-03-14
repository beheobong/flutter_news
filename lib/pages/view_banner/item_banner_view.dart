import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const images = [
  'assets/banner/bn1.jpg',
  'assets/banner/bn2.jpg',
  'assets/banner/bn3.jpg',
  'assets/banner/bn4.jpg',
  'assets/banner/bn5.jpg',
  'assets/banner/bn6.jpg',
];

class ViewBannerPage extends StatelessWidget {
  const ViewBannerPage({Key? key, required this.image}) : super(key: key);

  final String image;
  String get im {
    final random = Random();
    int randomNumber = random.nextInt(5);
    return images[randomNumber];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openUrl,
      child: Container(
        color: Colors.transparent,
        child: Image.asset(im),
      ),
    );
  }

  void _openUrl() {
    final url = Uri.parse('https://www.j8vip22.com/');
    launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
