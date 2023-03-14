import 'package:care_box/helpers/theme.dart';
import 'package:care_box/models/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthInitState());

  UserRepository get userRes => UserRepository.instance;

  int get themeIndex => userRes.theme;

  void appStart() {
    Themes.changeTheme(themeIndex);
    updateState();
  }

  void changeTheme(int value) async {
    Themes.changeTheme(value);
    userRes.saveTheme(value);
    updateState();
  }

  void updateState() {
    emit(AuthUpdateState());
    emit(AuthInitState());
  }
}
