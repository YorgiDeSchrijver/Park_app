
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/src/constants/colors.dart';

class TBottomNavigationBarTheme {
  static final lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: whiteColor,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: blackColor,
    unselectedItemColor: unselectedColor,
    selectedIconTheme: IconThemeData(color: accentColor, size: 20),
    unselectedIconTheme: IconThemeData(color: unselectedColor, size: 20),
    selectedLabelStyle: GoogleFonts.montserrat(fontSize: 10, height: 2.0, fontWeight: FontWeight.w500),
    unselectedLabelStyle: GoogleFonts.montserrat(fontSize: 10, height: 2.0, fontWeight: FontWeight.w500),
    type: BottomNavigationBarType.fixed
  );

  static final darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade900,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: whiteColor,
    unselectedItemColor: unselectedColor,
    selectedIconTheme: IconThemeData(color: primaryColor, size: 20),
    unselectedIconTheme: IconThemeData(color: unselectedColor, size: 20),
    selectedLabelStyle: GoogleFonts.montserrat(fontSize: 10, height: 2.0, fontWeight: FontWeight.w500),
    unselectedLabelStyle: GoogleFonts.montserrat(fontSize: 10, height: 2.0, fontWeight: FontWeight.w500),
  );

}