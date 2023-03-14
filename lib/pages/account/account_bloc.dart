import 'package:care_box/core/base_manager.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';
// import 'account_api_client.dart';
import 'account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBloc extends Cubit<AccountState>
    with  ApiPresenter, LoadingPresenter, BaseManager {
  AccountBloc(this.context) : super(AccountLoadingState());
  
  // final String _changeAvatarFunction = 'changeAvatar_func';
  // final String _changeWallPageFunction = 'changeWallPage_func';
  // late AccountApiClient _apiClient;
  String msgSuc = 'Cập nhật thành công!';

  @override
  final BuildContext context;


  @override
  Map<String, Function> get apiSubmits => throw UnimplementedError();
}
