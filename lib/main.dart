import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vesh_merchant/common/custom_widgets/bloc_initialiser.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/home/ui/tabs/profile.dart';
import 'package:vesh_merchant/login/ui/login.dart';
import 'package:vesh_merchant/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:vesh_merchant/splash_screen/builder/splash_screen_builder.dart';
import 'package:vesh_merchant/splash_screen/splash_screen.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(child: MyApp()),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context){
  return SplashScreenBloc(Default());
    },
    child: SplachScreenBuilder(),
    );
  }
}




/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SplashScreenBloc(
          Default(),
        );
      },
      child: BlocInitialiser(
        blocBuilder: SplachScreenBuilder(),
        blocFunction: (context) {
          context.read<SplashScreenBloc>().checkForLogin();
        },
      ),
    );
  }
}
*/