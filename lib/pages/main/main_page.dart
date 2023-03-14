import 'package:care_box/auth/auth.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/match/matchs_page.dart';
import 'package:care_box/pages/livestream/livestream_page.dart';
import 'package:care_box/pages/home/home_page.dart';
import 'package:care_box/pages/indivi/indivi_page.dart';
import 'package:care_box/pages/view_banner/item_banner_view.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (_) => MainBloc(context),
      child: const _MainPage(),
    );
  }
}

class _MainPage extends StatefulWidget {
  const _MainPage({Key? key}) : super(key: key);

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  MainBloc get _presenter => context.read<MainBloc>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _banner();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _presenter.pageController,
              children: const [
                HomePage(),
                LiveStreamPage(),
                MatchsPage(),
                IndiviPage(),
                // DetailIndiviPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppStyle.btnBg,
              selectedLabelStyle: Styles.copyStyle(
                color: AppStyle.main,
                fontSize: 12,
              ),
              unselectedLabelStyle: Styles.copyStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedItemColor: AppStyle.textBody,
              unselectedItemColor: Colors.grey.withOpacity(0.5),
              type: BottomNavigationBarType.fixed,
              currentIndex: _presenter.currentIndex,
              onTap: _presenter.changePage,
              items: [
                _itemBottom(
                  icon: 'assets/tabs/nav_news.png',
                  title: 'Tin mới',
                  index: 0,
                ),
                _itemBottom(
                  icon: 'assets/tabs/nav_vod.png',
                  title: 'Live',
                  index: 1,
                ),
                _itemBottom(
                  icon: 'assets/tabs/nav_apps.png',
                  title: 'Lịch thi đấu',
                  index: 2,
                ),
                _itemBottom(
                  icon: 'assets/tabs/nav_info.png',
                  title: 'Xu hướng',
                  index: 3,
                ),
              ],
            ),
          );
        },
      );
    });
  }

  _itemBottom({
    required String icon,
    required String title,
    int index = 0,
  }) {
    return BottomNavigationBarItem(
      icon: Image(
        image: AssetImage(icon),
        width: 24,
        height: 24,
        fit: BoxFit.cover,
        color: index == _presenter.currentIndex
            ? AppStyle.bgBottom
            : Colors.grey.withOpacity(0.5),
      ),
      label: title,
    );
  }

  void _banner() {
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
            actions: <Widget>[
              Column(
                children: <Widget>[
                  IconButton(
                    onPressed: _presenter.closeDialog,
                    icon: const Icon(Icons.close),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    color: AppStyle.closeDialog,
                  ),
                  const ViewBannerPage(image: 'assets/banner/bn1.jpg')
                ],
              )
            ],
          );
        });
  }
}
