import 'package:care_box/base/base_state.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/general_news/detail_general_news/detail_general_bloc.dart';
import 'package:care_box/pages/home/general_news/general_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailGeneralPage extends StatelessWidget {
  final GeneralNewsModel model;

  const DetailGeneralPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailGeneralBloc>(
      create: (ctx) => DetailGeneralBloc(context, model),
      child: const _DetailGeneralPage(),
    );
  }
}

class _DetailGeneralPage extends StatefulWidget {
  const _DetailGeneralPage({Key? key}) : super(key: key);

  @override
  _DetailHomeState createState() => _DetailHomeState();
}

class _DetailHomeState extends State<_DetailGeneralPage>
    with AutomaticKeepAliveClientMixin {
  DetailGeneralBloc get _presenter => context.read<DetailGeneralBloc>();

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);

    return BlocBuilder<DetailGeneralBloc, BaseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _presenter.appBar(
            title: _presenter.model.titleShow,
          ),
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