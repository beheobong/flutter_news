import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/themes/styles.dart';
import 'package:dudv_base/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SeeMoreTextView extends StatefulWidget {
  const SeeMoreTextView(
    this.text, {
    Key? key,
    this.trimLines = 2,
  }) : super(key: key);

  final String? text;
  final int trimLines;

  @override
  SeeMoreTextViewState createState() => SeeMoreTextViewState();
}

class SeeMoreTextViewState extends State<SeeMoreTextView> {
  bool _readMore = false;

  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    if (Utils.isEmpty(widget.text)) {
      return const SizedBox.shrink();
    } else if (widget.text!.length < 100) {
      return Text(
        widget.text!,
        style: Styles.copyStyle(color: AppStyle.black303030),
      );
    }

    Color colorClickableText = const Color(0xff1C7797);
    Color widgetColor = AppStyle.black303030;
    TextSpan link = TextSpan(
        text: _readMore ? '...Xem thêm' : ' Thu gọn',
        style: Styles.copyStyle(color: colorClickableText),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset)!;
        dynamic textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text!.substring(0, endIndex) : widget.text,
            style: TextStyle(
              color: widgetColor,
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
