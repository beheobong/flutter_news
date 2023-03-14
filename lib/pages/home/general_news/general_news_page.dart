import 'package:care_box/auth/auth.dart';
import 'package:care_box/base/base_state.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/general_news/general_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralNewsPage extends StatelessWidget {
  const GeneralNewsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeneralNewsBloc>(
      create: (ctx) => GeneralNewsBloc(context),
      child: const _GeneralNewsPage(),
    );
  }
}

class _GeneralNewsPage extends StatefulWidget {
  const _GeneralNewsPage({Key? key}) : super(key: key);

  @override
  _GeneralNewsState createState() => _GeneralNewsState();
}

class _GeneralNewsState extends State<_GeneralNewsPage>
    with AutomaticKeepAliveClientMixin {
  GeneralNewsBloc get _presenter => context.read<GeneralNewsBloc>();

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return BlocBuilder<GeneralNewsBloc, BaseState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppStyle.btnBg,
            body: RefreshIndicator(
              onRefresh: _presenter.onRefresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _presenter.controller,
                padding: const EdgeInsets.all(20),
                itemBuilder: _presenter.itemBuilder,
                itemCount: _presenter.list.length + 1,
              ),
            ),
          );
        },
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}


// SingleChildScrollView(
//               child: HtmlWidget(
//                 _presenter.list.length == 1
//                     ? (_presenter.list[0] as DetailIndiviModel).data ?? ""
//                     : "",
//                 textStyle: const TextStyle(color: AppStyle.whiteFFFFFF),
//               ),
//             ),