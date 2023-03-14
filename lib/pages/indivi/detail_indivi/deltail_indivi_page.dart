import 'package:care_box/base/base_state.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/indivi/detail_indivi/detail_indivi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../indivi_model.dart';

class DetailIndiviPage extends StatelessWidget {
  final ElementInvidi model;

  const DetailIndiviPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailIndiviBloc>(
      create: (ctx) => DetailIndiviBloc(context, model),
      child: const _DetailIndiviPage(),
    );
  }
}

class _DetailIndiviPage extends StatefulWidget {
  const _DetailIndiviPage({Key? key}) : super(key: key);

  @override
  _DetailIndiviState createState() => _DetailIndiviState();
}

class _DetailIndiviState extends State<_DetailIndiviPage>
    with AutomaticKeepAliveClientMixin {
  DetailIndiviBloc get _presenter => context.read<DetailIndiviBloc>();

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);

    return BlocBuilder<DetailIndiviBloc, BaseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _presenter.appBar(
            title: _presenter.model.a,
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
