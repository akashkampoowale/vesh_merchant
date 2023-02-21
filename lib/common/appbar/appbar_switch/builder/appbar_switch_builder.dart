
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vesh_merchant/common/appbar/appbar_switch/bloc/appbar_switch_bloc.dart';
import 'package:vesh_merchant/common/appbar/logged_out_app_bar/ui/logged_out_app_bar.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/splash_screen/bloc/splash_screen_bloc.dart';

class AppbarSwitchBuilder extends StatelessWidget {
  const AppbarSwitchBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<SplashScreenBloc>(),
      builder: (context,state){
        if(state is Success){
          return Text('test');
        }else{
          return LoggedOutAppBar();
        }
      },
    );
  }
}
