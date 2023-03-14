import 'package:care_box/auth/auth.dart';
import 'package:care_box/helpers/app_style.dart';
import 'package:care_box/pages/home/home_.dart';
import 'package:care_box/pages/match/matchs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchsPage extends StatelessWidget {
  const MatchsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MatchsBloc>(
      create: (ctx) => MatchsBloc(context),
      child: const _LiveStreamPage(),
    );
  }
}

class _LiveStreamPage extends StatefulWidget {
  const _LiveStreamPage({Key? key}) : super(key: key);

  @override
  _MatchsPageState createState() => _MatchsPageState();
}

class _MatchsPageState extends State<_LiveStreamPage>
    with AutomaticKeepAliveClientMixin {
  MatchsBloc get _presenter => context.read<MatchsBloc>();

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<MatchsBloc, BaseState>(
          builder: (context, state) {
            return Scaffold(
              appBar: _presenter.appBar(
                titleView:  Text(
                  "Lịch thi đấu",
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






// import 'package:care_box/helpers/app_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'matchs_.dart';

// class MatchsPage extends StatelessWidget {
//   const MatchsPage({Key? key, required}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<MatchsBloc>(
//       create: (ctx) => MatchsBloc(context),
//       child: const _MatchsPage(),
//     );
//   }
// }

// class _MatchsPage extends StatefulWidget {
//   const _MatchsPage({Key? key}) : super(key: key);

//   @override
//   State<_MatchsPage> createState() => _MatchsPageState();
// }

// class _MatchsPageState extends State<_MatchsPage> with AutomaticKeepAliveClientMixin{
//   MatchsBloc get _presenter => context.read<MatchsBloc>();

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return BlocBuilder<MatchsBloc, BaseState>(
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: AppStyle.screenBgColor,
//           appBar: _presenter.appBar(
//             titleView: const Text(
//               "Lịch thi đấu",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//           body: RefreshIndicator(
//             onRefresh: _presenter.onRefresh,
//             child: ListView.builder(
//               itemBuilder: _presenter.itemBuild,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               physics: const AlwaysScrollableScrollPhysics(),
//               itemCount: _presenter.list.length + 1,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
