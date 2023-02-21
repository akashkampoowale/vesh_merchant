import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vesh_merchant/common/custom_widgets/bloc_initialiser.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/get_started/ui/get_started.dart';
import 'package:vesh_merchant/login/ui/login.dart';
import 'package:vesh_merchant/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:vesh_merchant/splash_screen/splash_screen.dart';

class SplachScreenBuilder extends StatelessWidget {
  const SplachScreenBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        if (state is Success) {
          return SplashScreen();
        } else {
          return GetStarted();
        }
      },
      listener: (context, state) {},
      bloc: context.read<SplashScreenBloc>(),
    );
  }
}
