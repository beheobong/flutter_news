import 'package:care_box/base/base_state.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/hot_news/detail_home/detail_hotnews_bloc.dart';
import 'package:care_box/pages/home/hot_news/hot_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailHotNewsPage extends StatelessWidget {
  final HotNewsModel model;

  const DetailHotNewsPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailHotNewsBloc>(
      create: (ctx) => DetailHotNewsBloc(context, model),
      child: const _DetailHotNewsPage(),
    );
  }
}

class _DetailHotNewsPage extends StatefulWidget {
  const _DetailHotNewsPage({Key? key}) : super(key: key);

  @override
  _DetailHotNewsState createState() => _DetailHotNewsState();
}

class _DetailHotNewsState extends State<_DetailHotNewsPage>
    with AutomaticKeepAliveClientMixin {
  DetailHotNewsBloc get _presenter => context.read<DetailHotNewsBloc>();

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);

    return BlocBuilder<DetailHotNewsBloc, BaseState>(
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