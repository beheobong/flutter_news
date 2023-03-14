import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/helpers/images_asset_helper.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget implements PreferredSizeWidget {
  const SearchView({Key? key,  this.margin}) : super(key: key);

  final EdgeInsets? margin;

  @override
  State<StatefulWidget> createState() => _SearchViewState();

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight + 20);
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: widget.margin ??  EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppStyle.textFieldBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(ImageAsset.search),
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 10),
          Text(
            'Nhập nội dung tìm kiếm',
            style: Styles.copyStyle(
              color: AppStyle.greySreachLabel,
            ),
          )
        ],
      ),
    );
  }
}
