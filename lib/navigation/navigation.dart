import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vesh_merchant/add_product/ui/add_product.dart';
import 'package:vesh_merchant/edit_product/ui/edit_product.dart';
import 'package:vesh_merchant/get_started/ui/get_started.dart';
import 'package:vesh_merchant/home/ui/home_screen.dart';
import 'package:vesh_merchant/login/ui/login.dart';
import 'package:vesh_merchant/signup/ui/signup.dart';

navigation({route, context, productData}) {
  switch (route) {
    case 'login':
      navigate(LoginScreenProvider(), context);
      break;
    case 'home':
      navigate(HomeScreen(), context);
      break;
    case 'signup':
      navigate(Signup(), context);
      break;
    case 'add_product':
      navigate(AddProduct(), context);
      break;
    case 'edit_product':
      navigate(EditProduct(productData: productData,), context);
      break;
    default:
      navigate(GetStarted(), context);
      break;
  }
}

void navigate(screen, context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screen,
  ));
}
