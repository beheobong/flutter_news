import 'package:care_box/core/constant.dart';

class Themes {
  static String themKey = Constanst.lightTheme;
  static bool get isDark => themKey == Constanst.darkTheme;
  static bool get isLight => themKey == Constanst.lightTheme;

  static changeTheme(int value) {
    late String theme;
    if (value == 0) {
      theme = Constanst.lightTheme;
    } else {
      theme = Constanst.darkTheme;
    }
    themKey = theme;
  }


}
