import 'dart:ui';

import 'package:care_box/helpers/theme.dart';
import 'package:flutter/material.dart';

class AppStyle {
  AppStyle._();

  static Color get btnBg {
    if (Themes.isLight) {
      return _btnBg;
    }
    return _lbtnBg;
  }

  static Color get textBody {
    if (Themes.isDark) {
      return _textBody;
    }
    return _ltextBody;
  }

  static Color get bgContainer {
    if (Themes.isLight) {
      return _bgContainer;
    }
    return _lbgContainer;
  }

  static Color get bgBottom {
    if (Themes.isLight) {
      return _bgBottom;
    }
    return _lbgBottom;
  }

  static Color get closeDialog {
    if (Themes.isDark) {
      return _closeDialog;
    }
    return _lcloseDialog;
  }

  static Color get indicator {
    if (Themes.isDark) {
      return _indicator;
    }
    return _lindicator;
  }

  //Theme dark
  static const Color _btnBg = Color(0xff0D122C);
  static const Color _textBody = Color(0xff0D122C);
  static const Color _bgContainer = Color(0xff000033);
  static const Color _bgBottom = Color(0xffffffff);
  static const Color _closeDialog = Color(0xffffffff);
  static const Color _indicator = Color(0xff0D122C);
  //Theme light
  static const Color _lbtnBg = Color(0xffffffff);
  static const Color _ltextBody = Color(0xffffffff);
  static const Color _lbgContainer = Colors.grey;
  static const Color _lbgBottom = Color(0xff303030);
  static const Color _lcloseDialog = Colors.orange;
  static const Color _lindicator = Color(0xffffffff);

  // define common color
  static const blue5 = Color(0xff54BADE);
  static const main = Color(0xffEE4E2E);
  static const progressBarColor = Color(0xff54BADE);
  static const bottomBtnColor = Color(0xff2891B5);
  static const textFieldBorderColor = Color(0xffE5E5E5);
  static const screenBgColor = Color(0xff0D122C);
  static const whiteFFFFFF = Color(0xffFFFFFF);

  //grey
  static const greyE5E5E5 = Color(0xffE5E5E5);
  static const greyF0F1F5 = Color(0xffF0F1F5);
  static const bg = Color(0xffF0F1F5);
  static const grey778 = Color(0xff77838F);

  //blue
  static const blue2891B5 = Color(0xff2891B5);

  //red
  static const redCE3737 = Color(0xffCE3737);

  //black #303030
  static const black303030 = Color(0xff303030);

  //color black.
  static const black1 = Color(0xff303030);
  static const black2 = Color(0xff32302F);
  static const black1E2 = Color(0xff1E2022);

  //color grey.
  static const grey1 = Color(0xff787878);
  static const grey2 = Color(0xffB9B9B9);
  static const grey4 = Color(0xff303030);
  static const blue1C = Color(0xff1C7797);
  static const greySubTitle = Color(0xff979797);
  static const greySreachLabel = Color(0xff707070);
  static const greysubTitle2 = Color(0xff989898);
  static const greyF5 = Color(0xfff5f5f5);

  //color blue.
  static const blue1 = Color(0xff1C7797);

  //color blue
  static const green1 = Color(0xff32BE81);

  //color yellow
  static const yellow1 = Color(0xffF6C57D);
  static const yellow2 = Color(0xffDEA254);
  static const yellowD4 = Color(0xffD49441);

  static const greyE9 = Color(0xffe9e9e9);
  static const blue54 = Color(0xff54BADE);
  static const greyA4 = Color(0xffA4A3A3);
  static const grey707070 = Color(0xff707070);

  static const Color textGrey = Color(0xff303030);

  // define common fontsize
  static const double smallTextSize = 12;
  static const double normalTextSize = 14;
  static const double largeTextSize = 16;
  static const double largeTextSize18 = 18;
  static const double hugeTextSize = 20;
  static const double giantTextSize = 24;

  // define common text style
  static const appBarTitleStyle = TextStyle(
    color: Colors.black,
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle defaultRegular = TextStyle(
    fontStyle: FontStyle.normal,
    color: black303030,
    fontWeight: FontWeight.normal,
    fontSize: normalTextSize,
    fontFeatures: [
      FontFeature.tabularFigures(),
    ],
  );

  static final textWithFade = TextStyle(
    color: black303030.withOpacity(0.5),
    fontSize: largeTextSize,
  );

  static const bottomBtnTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: largeTextSize,
  );

  static const normalTitleStyle = TextStyle(
    color: Colors.black,
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );
  static const headerTitle = TextStyle(
    color: black303030,
    fontSize: largeTextSize,
    fontWeight: FontWeight.bold,
  );

  static final headline1Style =
      normalTitleStyle.copyWith(fontSize: hugeTextSize);
  static final headline2Style =
      normalTitleStyle.copyWith(fontSize: largeTextSize);

  static final hintStyle = TextStyle(
    color: Colors.black.withOpacity(0.5),
    fontSize: normalTextSize,
  );

  // define common button style
  static final bottomBtnPrimaryStyle = ElevatedButton.styleFrom(
    backgroundColor: bottomBtnColor,
    textStyle: bottomBtnTitleStyle,
  );

  static final bottomBtnSecondaryStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    textStyle: bottomBtnTitleStyle.copyWith(color: main),
  );
  static TextStyle headingBold20({Color? color}) => TextStyle(
      fontSize: 20, color: color ?? black2, fontWeight: FontWeight.bold);
  static TextStyle headingBold16({Color? color}) => TextStyle(
      fontSize: 16, color: color ?? black2, fontWeight: FontWeight.w600);
  static TextStyle headingBold14({Color? color}) => TextStyle(
      fontSize: 14, color: color ?? black2, fontWeight: FontWeight.bold);

  static TextStyle body20({Color? color}) => TextStyle(
      fontSize: 20, color: color ?? black2, fontWeight: FontWeight.w400);
  static TextStyle body16({Color? color}) => TextStyle(
      fontSize: 16, color: color ?? black2, fontWeight: FontWeight.w400);
  static TextStyle body14({Color? color}) => TextStyle(
      fontSize: 14, color: color ?? black2, fontWeight: FontWeight.w400);

  static OutlineInputBorder inputBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? AppStyle.textFieldBorderColor,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    );
  }
}
