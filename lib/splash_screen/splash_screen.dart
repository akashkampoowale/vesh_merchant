
import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/paths/paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Center(child:
          Image.asset('$imagepath/vesh_temp_logo.png'),
          ),
    );
  }
}
