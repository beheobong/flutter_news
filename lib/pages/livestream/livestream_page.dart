import 'package:care_box/auth/auth.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'livestream.dart';

class LiveStreamPage extends StatelessWidget {
  const LiveStreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LiveStreamBloc>(
      create: (ctx) => LiveStreamBloc(context),
      child: const _LiveStreamPage(),
    );
  }
}

class _LiveStreamPage extends StatefulWidget {
  const _LiveStreamPage({Key? key}) : super(key: key);

  @override
  _LiveStreamState createState() => _LiveStreamState();
}

class _LiveStreamState extends State<_LiveStreamPage>
    with AutomaticKeepAliveClientMixin {
  LiveStreamBloc get _presenter => context.read<LiveStreamBloc>();

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<LiveStreamBloc, BaseState>(
          builder: (context, state) {
            return Scaffold(
              appBar: _presenter.appBar(
                titleView: Text(
                  "LiveStream",
                  style: TextStyle(
                    color: AppStyle.textBody,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              backgroundColor: AppStyle.btnBg,
              body: RefreshIndicator(
                onRefresh: _presenter.onRefresh,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
}
