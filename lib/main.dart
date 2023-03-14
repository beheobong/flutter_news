import 'package:care_box/core/base_manager.dart';
import 'package:care_box/core/pref_util.dart';
import 'package:care_box/pages/main/main_page.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/auth.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      if (kDebugMode) {
        print(change);
      }
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.instance.init();
  Bloc.observer = AppBlocObserver();
  Styles.config(color: Colors.black);
  runApp(const Application());
  // BlocOverrides.runZoned(
  //   () async {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     // await Firebase.initializeApp(
  //     //   name: const Uuid().v1(),
  //     //   options: DefaultFirebaseConfig.platformOptions,
  //     // );
  //     Styles.config(color: Colors.black);
  //     runApp(const Application());
  //   },
  //   blocObserver: AppBlocObserver(),
  // );
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc()..appStart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter News',
        theme: BaseManager.themeData,
        home: const MainPage(),
      ),
    );
  }
}
