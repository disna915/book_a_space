import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/config/color.dart';

class StyleResources {
  static TextStyle mainHeadStyle(BuildContext context) {
    double size = 18.0;
    return GoogleFonts.poppins(
      color: AppColor.white,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle createStyle(BuildContext context) {
    double size = 18.0;
    return GoogleFonts.poppins(
      decoration: TextDecoration.underline,
      decorationColor: AppColor.primary,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 2.0,
      color: AppColor.primary,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle buttonText(BuildContext context, Color color) {
    double size = 20.0;
    return GoogleFonts.poppins(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle labelText() {
    return GoogleFonts.poppins(
      color: AppColor.greyTextFeildName,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle hintText() {
    return GoogleFonts.poppins(
      color: AppColor.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }
}
