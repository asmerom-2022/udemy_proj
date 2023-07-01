import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const containercolors = Color.fromARGB(255, 51, 68, 112);
const bgColor = Color(0xFF212332);

// dashboard card color
const packcolor = Color.fromARGB(255, 217, 207, 56);
const delivercolor = Color.fromRGBO(3, 167, 244, 0.941);
const compcolor = Color.fromRGBO(76, 175, 80, .9);
const ordercolors = Color.fromRGBO(77, 182, 172, .9);

const xsPadding = 4.0;
const sPadding = 8.0;
const defaultPadding = 16.0;
const mPadding = 32.0;

cardTextstyle({required Color color}) {
  return TextStyle(
    color: color,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.workSans().fontFamily,
  );
}

timerStyle() {
  return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 64,
      fontFamily: GoogleFonts.workSans().fontFamily,
      color: Colors.white70);
}

TitleText(title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 20, color: Colors.white),
  );
}
