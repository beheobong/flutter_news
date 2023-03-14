import 'package:care_box/core/pref_util.dart';
import 'package:hive/hive.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();

  UserRepository._internal();
  final String _themeKey = 'ThemeKey';
  Box get _box => SharedPrefs.instance.prefs;

  static UserRepository get instance => _instance;

  int get theme {
    return _box.get(_themeKey) ?? 0;
  }

  Future saveTheme(int value) {
    return _box.put(_themeKey, value);
  }
}
