import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DColors {
  static const Color blue = Color(0xff426DDB);
  static const Color darkerBlack = Color(0xff404040);
  static const Color green = Color(0xff2ECC71);
  static const Color subtleBlue = Color(0xffEFF3FF);
  static const Color lightBlue = Color(0xff4DA9FF);
  static const Color red = Color(0xffD72C0D);
  static const Color black = Color(0xff171616);
  static const Color darkGrey = Color(0xffBFBFBF);
  static const Color subtleGrey = Color(0xffF3F4F8);
  static const Color grey = Color(0xffABABAB);
}

class DBackground {
  static const Color light = Color(0xffFCFCFC);
  static const Color lightGrey = Color(0xffF6F6F6);
  static const Color blue = DColors.blue;
  static const Gradient gradientBlue = LinearGradient(
    colors: [Color(0xff6E5DE7), Color.fromARGB(255, 76, 56, 202)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );
}

class DFontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight reguler = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

class DTextSizes {
  static const double extraSmall3x = 8.0;
  static const double extraSmall2X = 10.0;
  static const double extraSmall = 12.0;
  static const double small = 14.0;
  static const double normal = 16.0;
  static const double medium = 18.0;
  static const double large = 20.0;
  static const double extraLarge = 24.0;
  static const double extraLarge2x = 32.0;
}

class DTextStyle {
  static TextStyle setStyle(
      {double size = DTextSizes.normal,
      FontWeight fontWeight = DFontWeight.reguler,
      Color color = DColors.black}) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
