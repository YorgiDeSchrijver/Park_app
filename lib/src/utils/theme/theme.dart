import 'package:flutter/material.dart';
import 'package:project/src/utils/theme/widget_themes/app_bar_theme.dart';
import 'package:project/src/utils/theme/widget_themes/bottom_navigation_bar_theme.dart';
import 'package:project/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:project/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:project/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:project/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme{

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    bottomNavigationBarTheme: TBottomNavigationBarTheme.lightBottomNavigationBarTheme,
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    bottomNavigationBarTheme: TBottomNavigationBarTheme.darkBottomNavigationBarTheme,
  );
}
