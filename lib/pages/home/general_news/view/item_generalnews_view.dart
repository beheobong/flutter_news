import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/general_news/general_news_model.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:flutter/material.dart';

class ItemGeneralNewsView extends StatelessWidget {
  const ItemGeneralNewsView(
      {Key? key,
      required this.generalNews,
      re,
      required this.itemGeneral,
      required this.showBanner})
      : super(key: key);

  final GeneralNewsModel generalNews;
  final ValueChanged<GeneralNewsModel> itemGeneral;
  final bool showBanner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => itemGeneral(generalNews),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    color: Colors.grey[350],
                    child: Image(
                      image: CachedNetworkImageProvider(generalNews.img ?? ''),
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ),
                _width(10),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              generalNews.title ?? "",
                              style: TextStyle(
                                color: AppStyle.textBody,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            _height(7),
                            Text(
                              generalNews.time ?? "",
                              style: TextStyle(
                                color: AppStyle.textBody,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (showBanner)
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: ViewBannerPage(image: 'assets/banner/bn2.jpg'),
              ),
            _height(20),
          ],
        ),
      ),
    );
  }

  Widget _height(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _width(double width) {
    return SizedBox(
      width: width,
    );
  }
}
