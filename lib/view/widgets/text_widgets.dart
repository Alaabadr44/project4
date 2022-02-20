import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextRegular extends StatelessWidget {
  const TextRegular({
    Key? key,
    required this.text,
    required this.textColor,
    this.fontWeight = FontWeight.w400,
    required this.fontSize,
  }) : super(key: key);
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.sourceSansPro().copyWith(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ));
  }
}
