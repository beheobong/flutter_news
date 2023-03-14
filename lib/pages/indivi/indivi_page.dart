import 'package:care_box/auth/auth.dart';
import 'package:care_box/base/base_state.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/indivi/indivi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndiviPage extends StatelessWidget {
  const IndiviPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IndiviBloc>(
      create: (ctx) => IndiviBloc(context),
      child: const _IndiviPage(),
    );
  }
}

class _IndiviPage extends StatefulWidget {
  const _IndiviPage({Key? key}) : super(key: key);

  @override
  _IndiviPageState createState() => _IndiviPageState();
}

class _IndiviPageState extends State<_IndiviPage>
    with AutomaticKeepAliveClientMixin {
  IndiviBloc get _presenter => context.read<IndiviBloc>();

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<IndiviBloc, BaseState>(
          builder: (context, state) {
            return Scaffold(
              appBar: _presenter.appBar(
                titleView: Text(
                  "Xu hướng",
                  style: TextStyle(
                    color: AppStyle.textBody,
                    fontSize: 18,
                  ),
                ),
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
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
