

import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/colors/colors.dart';

const addProductStockInputDecration = InputDecoration(
  border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent)
  ),
  counterText: "",
  contentPadding: EdgeInsets.all(0),
  hintText: '0',
  hintStyle: TextStyle(color: loginHintTextColor),
  fillColor: Colors.white,
  filled: true,
);

const addProductStockTextStyles = TextStyle(
    fontSize: 20
);