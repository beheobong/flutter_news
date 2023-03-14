import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/livestream/item_livestream_model.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:flutter/material.dart';

class ItemLiveStreamView extends StatelessWidget {
  const ItemLiveStreamView({
    Key? key,
    required this.liveModel,
    required this.onTap,
    required this.showBanner,
  }) : super(key: key);

  final LiveStreamModel liveModel;
  final ValueChanged<LiveStreamModel> onTap;
  final bool showBanner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showBanner)
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ViewBannerPage(image: 'assets/banner/bn3.jpg'),
          ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xff161616),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                liveModel.matchesStatus ?? "",
                                style: const TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppStyle.bgContainer,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _fbItem(
                                    image: liveModel.team1!.logo ?? "",
                                    title: liveModel.team1!.title ?? "",
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () => onTap(liveModel),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          // height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.red),
                                          child: const Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Xem ngay",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: _fbItem(
                                    image: liveModel.team2!.logo ?? "",
                                    title: liveModel.team2!.title ?? "",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _height(20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _height(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _fbItem({required String image, required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 60,
          height: 60,
          image: CachedNetworkImageProvider(
            image,
          ),
        ),
        _height(5),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: AppStyle.textBody,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
