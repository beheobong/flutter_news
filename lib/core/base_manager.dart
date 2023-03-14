import 'package:care_box/auth/auth.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///1. quản lý view chung mà 80% các màn dùng: appbar, dialog confirm, button...
///2 lấy thông tin model chung: user
///3. khi dùng 1 lib 80% chỉ dùng ở đây để sau này lib bị bỏ hoặc lỗi => thay cho dễ
mixin BaseManager {
  BuildContext get context;

  // AuthBloc get _auth => context.watch<AuthBloc>();
  AuthBloc get _authRead => context.read<AuthBloc>();

  int get themeIndex => _authRead.themeIndex;

  void changeTheme(int value) {
    _authRead.changeTheme(value);
  }

  static ThemeData get themeData => ThemeData(
        primaryColor: AppStyle.main,
        primarySwatch:
            MaterialColor(AppStyle.main.value, Styles.getSwatch(AppStyle.main)),
        backgroundColor: Colors.white,
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: AppStyle.bottomBtnPrimaryStyle),
        textTheme: TextTheme(
          headline1: AppStyle.headline1Style,
          headline2: AppStyle.headline2Style,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      );

  AppBar appBar({
    String? title,
    String? leftTitle,
    bool centerTitle = true,
    double elevation = 0,
    Color? bgColor,
    TextStyle? titleStyle,
    PreferredSizeWidget? bottom,
    List<Widget>? actions,
    Widget? leading,
    Widget? titleView,
    bool gradient = false,
  }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final titleWidget = titleView ??
        (title == null
            ? null
            : Text(
                title,
                style: titleStyle ?? Styles.appBar(color: AppStyle.textBody),
              ));
    return AppBar(
      elevation: elevation,
      backgroundColor: bgColor ?? Colors.transparent,
      title: titleWidget,
      centerTitle: centerTitle,
      leading: leading ?? (parentRoute!.canPop ? leadingView : null),
      // leading: Padding(
      //   padding: const EdgeInsets.only(left: 10),
      //   child: Image.asset("assets/tabs/logo_draw.png"),
      // ),
      actions: actions,
      bottom: bottom,
    );
  }

  Widget get leadingView {
    return BackButton(
      onPressed: onBackPress,
      color: AppStyle.textBody,
    );
  }

  Future<bool> onBackPress({value}) {
    return Navigator.maybePop(context, value);
  }

  AppBar appBarPage() {
    return AppBar(
      backgroundColor: AppStyle.screenBgColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset(
          "assets/tabs/logo_draw.png",
        ),
      ),
      title: const Text("Tin mới"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  Widget btnConfirm(
      {String txtBtn = '', bool withColorBG = true, VoidCallback? callBack}) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: withColorBG ? AppStyle.blue2891B5 : AppStyle.whiteFFFFFF,
      child: InkWell(
        onTap: callBack,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppStyle.blue2891B5)),
          child: Text(txtBtn,
              style: AppStyle.defaultRegular.copyWith(
                  color:
                      withColorBG ? AppStyle.whiteFFFFFF : AppStyle.blue2891B5,
                  fontWeight: FontWeight.bold,
                  fontSize: AppStyle.largeTextSize)),
        ),
      ),
    );
  }

 
}
