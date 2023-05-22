
import 'package:flutter/material.dart';

class TAppBarTheme {
  static final lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.blue[50],
    actionsIconTheme: IconThemeData(color: Colors.black87),
    centerTitle: true,
    elevation: 0,
    foregroundColor: Colors.black54,
  );

  static final darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.grey.shade900,
    actionsIconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    elevation: 0,

    foregroundColor: Colors.white,
  );
}