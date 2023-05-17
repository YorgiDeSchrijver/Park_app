import 'package:flutter/material.dart';
import 'package:project/src/constants/colors.dart';

class TTextFormFieldTheme {

  static final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    prefixIconColor: secondaryColor,
    floatingLabelStyle: TextStyle(color: secondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: secondaryColor),
    ),
  );

  static final InputDecorationTheme darkInputDecorationTheme =  InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    prefixIconColor: primaryColor,
    floatingLabelStyle: TextStyle(color: primaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: primaryColor),
    ),
  );
}
