
import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/colors/colors.dart';


loginTextField({hintText}){
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: 24,
      color: loginHintTextColor,

    ),
    filled: true,
    fillColor: loginTextfieldBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),


  );
}

loginTextStyle(){
  return TextStyle(
    fontSize: 20,
  );
}