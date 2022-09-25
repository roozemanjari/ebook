import 'package:ebook/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarTheme {
  AppbarTheme._();

  static TextStyle appBarHeading = GoogleFonts.sarina(
    fontWeight: FontWeight.w400,
    fontSize: 25.0,
  );

  static TextStyle textbutton = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: Colors.white,
  );

  static TextStyle authbutton = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    color: primaryColor,
  );
}

class BodyTheme {
  BodyTheme._();

  static TextStyle sloganTextBlack = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 30.0,
    color: Colors.black,
  );

  static TextStyle sloganTextMaroon = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 30.0,
    color: primaryColor,
  );

  static TextStyle booknameText = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 17.0,
    color: Colors.white,
  );

  static TextStyle genresNameText = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 22.0,
    color: primaryColor,
  );

  static TextStyle aboutUsText = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
    color: primaryColor,
    letterSpacing: 1.3,
  );

  static TextStyle copyrightText = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 22.0,
    color: primaryColor.withOpacity(0.45),
  );
}
