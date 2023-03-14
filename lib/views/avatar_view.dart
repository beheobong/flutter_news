import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({
    Key? key,
    this.avatarSize = 46,
    this.url,
    this.paddingH,
    this.onClick,
    this.title,
    this.margin,
    this.assetDefault,
    this.paddingTopTitle,
    this.crossAxisAlignment,
    this.fixAvatarTitle = false,
  }) : super(key: key);

  final double avatarSize;
  final String? url;
  final double? paddingH;
  final double? paddingTopTitle;
  final GestureTapCallback? onClick;
  final String? title;
  final String? assetDefault;
  final EdgeInsets? margin;
  final bool fixAvatarTitle;
  final CrossAxisAlignment? crossAxisAlignment;

  ImageProvider get _image {
    if (Utils.imageOk(url)) {
      return CachedNetworkImageProvider(url!);
    }
    return AssetImage(
      assetDefault ?? 'assets/icons/ic_avatar.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic container = Container(
      height: avatarSize,
      width: avatarSize,
      margin: margin ?? EdgeInsets.symmetric(horizontal: paddingH ?? 10),
      decoration: BoxDecoration(
          color: assetDefault != null ? Colors.transparent : AppStyle.grey1,
          borderRadius: BorderRadius.circular(avatarSize / 2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(avatarSize / 2),
        child: Image(
          height: double.infinity,
          width: double.infinity,
          image: _image,
          fit: BoxFit.cover,
        ),
      ),
    );
    if (title != null) {
      Widget text = Text(
        title!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Styles.copyStyle(
            color: Colors.white, fontSize: fixAvatarTitle ? 13 : null),
      );
      if (fixAvatarTitle) {
        text = SizedBox(
          width: avatarSize,
          child: text,
        );
      }
      container = Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          container,
          if (paddingTopTitle != null)
            SizedBox(
              height: paddingTopTitle,
            ),
          text,
        ],
      );
    } else if (onClick == null) {
      return container;
    }
    return GestureDetector(
      child: container,
      onTap: onClick,
    );
  }
}
