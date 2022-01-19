import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kWhite = Color(0xffFFFFFF);
const Color kRichWhite = Color(0xffF8F8F8);
const Color kRichBlack = Color(0xff0A0A0A);
const Color kPastelGreen = Color(0xffDCFFF4);
const Color kBeachTurquoise = Color(0xff00E0D2);
const Color kPurple = Color(0xff9969FF);
const Color kPastelPurple = Color(0xffD4C4F5);
const Color kPastelGrey = Color(0xffDADADA);

double margin = 24;

final TextStyle kHeading5 = GoogleFonts.poppins(
  fontSize: 23,
  fontWeight: FontWeight.w400,
);

final TextStyle kHeading6 = GoogleFonts.poppins(
  fontSize: 19,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);

final TextStyle kSubtitle = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);

final TextStyle kBodyText = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,
);

const kColorScheme = ColorScheme(
  primary: kBeachTurquoise,
  primaryVariant: kBeachTurquoise,
  secondary: kPurple,
  secondaryVariant: kPurple,
  surface: kRichBlack,
  background: kRichBlack,
  error: Colors.red,
  onPrimary: kRichBlack,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);
