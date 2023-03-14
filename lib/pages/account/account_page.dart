import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'account_.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountBloc>(
      create: (ctx) => AccountBloc(context),
      child: const _AccountPage(),
    );
  }
}

class _AccountPage extends StatefulWidget {
  const _AccountPage({Key? key}) : super(key: key);

  @override
  State<_AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<_AccountPage> {
  AccountBloc get _presenter => context.read<AccountBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
        return  Scaffold(
          appBar: _presenter.appBarPage(),
          body: const Text('abc'),
        );
      }
    );
  }
}
