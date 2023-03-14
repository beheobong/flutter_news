import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';

/// Tuyệt đối không được dùng box.clear()
/// vì nó sẽ xoá toàn bộ dữ liệu local app
/// nếu muốn xoá dữ liệu nào đó dùng methob: box.delete(key cần xoá);

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  SharedPrefsKey get keys => SharedPrefsKey.instance;
  late Box prefs;

  SharedPrefs._internal();

  bool _inited = false;

  static SharedPrefs get instance => _instance;

  Future<SharedPrefs> init() async {
    Completer<SharedPrefs> completer = Completer<SharedPrefs>();
    if (_inited) {
      completer.complete(_instance);
    } else {
      // Hive.registerAdapter(LoginModelAdapter());
      await Hive.initFlutter();
      prefs = await Hive.openBox(keys.prefKey);
      _inited = true;
      completer.complete(_instance);
    }
    return completer.future;
  }
}

class SharedPrefsKey {
  static final SharedPrefsKey _instance = SharedPrefsKey._internal();

  SharedPrefsKey._internal();

  static SharedPrefsKey get instance => _instance;

  String get prefKey => "pref_key";

  
}
