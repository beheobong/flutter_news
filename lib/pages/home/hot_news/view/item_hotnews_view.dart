import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/hot_news/hot_news_model.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class ItemHotNewsView extends StatelessWidget {
  const ItemHotNewsView({
    Key? key,
    required this.model,
    required this.onTap,
    required this.showBanner,
  }) : super(key: key);

  final HotNewsModel model;
  final ValueChanged<HotNewsModel> onTap;
  final bool showBanner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showBanner)
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ViewBannerPage(image: 'assets/banner/bn1.jpg'),
          ),
        GestureDetector(
          onTap: () => onTap(model),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  color: Colors.grey[350],
                  child: Image(
                    image: CachedNetworkImageProvider(model.img ?? ''),
                    fit: BoxFit.fill,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Text(
                  model.titleShow,
                  style: Styles.copyStyle(
                      color: AppStyle.textBody, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
