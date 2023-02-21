import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/login/network/repositories/login_repository.dart';
import 'package:vesh_merchant/navigation/navigation.dart';

class LoginBloc extends Cubit {



  BuildContext context;
  LoginBloc(super.initialState,this.context);

  var loginRespository = LoginRepository();

  void login({username, password}) async {
    emit(Progress());
    final prefs = await SharedPreferences.getInstance();

    loginRespository
        .login(username: username, password: password)
        .then((loginResponse) {
      if (loginResponse.uToken != 'fail') {
        prefs.setBool('isLoggedIn', true);
        prefs.setString('uid', loginResponse.uid);
        prefs.setString('uToken', loginResponse.uToken);



        emit(Success());
        Navigator.popUntil(context, ModalRoute.withName('/LoginScreen'));
        navigation(route: 'home',context: context);
      } else {
        if(loginResponse.comment == 'credentials_mismatched'){
            emit(Fail(failCause: 'Credentials mismatched'));
        }else{
          emit(Fail(failCause: 'Provide both fields'));
        }

      }
    });
  }
}
