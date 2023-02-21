import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/colors/colors.dart';


class LoggedInAppBar extends StatelessWidget {
  const LoggedInAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('VÉSH Merchant'),
      centerTitle: true,
      backgroundColor: appbarBackgroundColor,
    );
  }
}