import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vesh_merchant/common/custom_functions/is_user_logged_in/is_user_logged_in.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';

class SplashScreenBloc extends Cubit {
  SplashScreenBloc(super.initialState);

  void checkForLogin() async {
    emit(Progress());

    final userLoggedIn = await isUserLoggedIn();

    if (userLoggedIn) {
      emit(Success());
    } else {
      emit(Fail(failCause: 'fail'));
    }
  }
}


