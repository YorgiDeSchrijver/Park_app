import 'package:flutter/material.dart';
import 'package:project/src/constants/colors.dart';

class TTextFormFieldTheme {

  static final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: secondaryColor,
    floatingLabelStyle: TextStyle(color: secondaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(width: 2, color: secondaryColor),
    ),
  );

  static final InputDecorationTheme darkInputDecorationTheme =  InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: primaryColor,
    floatingLabelStyle: TextStyle(color: primaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(width: 2, color: primaryColor),
    ),
  );
}
