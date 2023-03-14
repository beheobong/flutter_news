import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/indivi/indivi_model.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:flutter/material.dart';

class ItemIndiviView extends StatelessWidget {
  const ItemIndiviView(
      {Key? key,
      required this.indivi,
      re,
      required this.onTapToDetail,
      required this.showBanner})
      : super(key: key);

  final ElementInvidi indivi;
  final ValueChanged<ElementInvidi> onTapToDetail;
  final bool showBanner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapToDetail(indivi),
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
                      image: CachedNetworkImageProvider(indivi.img ?? ''),
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
                        child: Text(
                          indivi.a ?? "",
                          style: TextStyle(
                            color: AppStyle.textBody,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _height(20),
            if (showBanner)
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: ViewBannerPage(image: 'assets/banner/bn6.jpg'),
              )
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
