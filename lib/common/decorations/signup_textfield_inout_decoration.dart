
import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/colors/colors.dart';

signupTextFieldInputDecoration({hintText}){
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    hintText: hintText,
    counterText: '',
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