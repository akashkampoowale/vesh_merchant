import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/colors/colors.dart';


class LoggedOutAppBar extends StatelessWidget {
  const LoggedOutAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('VÉSH Merchant'),
      centerTitle: true,
      backgroundColor: appbarBackgroundColor,
    );
  }
}