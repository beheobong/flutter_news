import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/match/matchs_response_model.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:flutter/material.dart';

class ItemMatchsView extends StatelessWidget {
  const ItemMatchsView({
    Key? key,
    required this.matchs,
    required this.showBanner,
  }) : super(key: key);

  final MatchsResponseModel matchs;
  final bool showBanner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showBanner)
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ViewBannerPage(image: 'assets/banner/bn4.jpg'),
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
                                matchs.leagueTitle ?? "",
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
                                    image: matchs.team1!.logo ?? "",
                                    title: matchs.team1!.title ?? "",
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
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
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              matchs.matchHour ?? "",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
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
                                    image: matchs.team2!.logo ?? "",
                                    title: matchs.team2!.title ?? "",
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
              _height(20)
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
    const size = 60.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: image,
          height: size,
          width: size,
          errorWidget: (context, url, error) => const Image(
            width: size,
            height: size,
            image: AssetImage('assets/icons/nopic.jpeg'),
          ),
          placeholder: (context, url) => const SizedBox(
              width: size, height: size, child: CircularProgressIndicator()),
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
