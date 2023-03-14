import 'package:care_box/auth/auth.dart';
import 'package:care_box/base/base.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/general_news/general_news_page.dart';
import 'package:care_box/pages/home/home_bloc.dart';
import 'package:care_box/pages/home/hot_news/hot_news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animated_toggle.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(context),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage>
    with AutomaticKeepAliveClientMixin {
  HomeBloc get _presenter => context.read<HomeBloc>();

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return BlocBuilder<HomeBloc, BaseState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: AppStyle.btnBg,
              appBar: _presenter.appBar(
                  bottom: TabBar(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    indicatorColor: AppStyle.indicator,
                    tabs: [
                      Tab(child: _title(title: "Tin nóng")),
                      Tab(child: _title(title: "Tin tổng hợp")),
                    ],
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Center(
                      child: Image.asset(
                        "assets/icons/icon_laucher.png",
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  titleView: Text(
                    "Tin mới",
                    style: TextStyle(
                        color: AppStyle.textBody,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  actions: [
                    AnimatedToggle(
                      values: const ['Sáng', 'Tối'],
                      index: _presenter.themeIndex,
                      onToggleCallback: _presenter.changeTheme,
                      buttonColor: const Color(0xFF0A3157),
                      backgroundColor: const Color(0xFFB5C1CC),
                      textColor: const Color(0xFFFFFFFF),
                    ),
                  ]),
              body: const TabBarView(
                children: [
                  HotNewsPage(),
                  GeneralNewsPage(),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  Widget _title({required String title}) {
    return Text(
      title,
      style: TextStyle(
        color: AppStyle.textBody,
        fontSize: 16,
      ),
    );
  }
}
