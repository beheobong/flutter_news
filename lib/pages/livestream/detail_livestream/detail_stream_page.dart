import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:care_box/pages/livestream/item_livestream_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'detail_stream_bloc.dart';

class DetailStreamPage extends StatelessWidget {
  const DetailStreamPage({Key? key, required this.model}) : super(key: key);
  final LiveStreamModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailStreamBloc>(
      create: (ctx) => DetailStreamBloc(context, model),
      child: const _DetailStreamPage(),
    );
  }
}

class _DetailStreamPage extends StatefulWidget {
  const _DetailStreamPage({Key? key}) : super(key: key);

  @override
  _DetailStreamState createState() => _DetailStreamState();
}

class _DetailStreamState extends State<_DetailStreamPage> {
  DetailStreamBloc get _presenter => context.read<DetailStreamBloc>();

  @override
  Widget build(BuildContext ctx) {
    return BlocBuilder<DetailStreamBloc, BaseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _presenter.appBar(
            title: _presenter.model.title,
          ),
          backgroundColor: AppStyle.btnBg,
          body: RefreshIndicator(
            onRefresh: _presenter.onRefresh,
            child: _body(),
          ),
        );
      },
    );
  }

  Widget _body() {
    if (_presenter.urlStream == null) {
      return _presenter.loadingView2();
    } else {
      return InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(_presenter.urlStream!)),
      );
    }
  }

}
