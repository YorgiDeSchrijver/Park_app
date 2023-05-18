import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static final TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(color: Colors.black87, fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.montserrat(color: Colors.black87, fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall: GoogleFonts.montserrat(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.poppins(color: Colors.grey[500], fontWeight: FontWeight.w600),
    bodyMedium: GoogleFonts.poppins(color:  Colors.black87, fontWeight: FontWeight.w500),
  );

  static final TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.montserrat(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.poppins(color: Colors.white60 , fontWeight: FontWeight.w600),
    bodyMedium: GoogleFonts.poppins(color: Colors.white),
  );
}

