import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'inter',
  cardColor: Colors.white,
  primaryColor: const Color(0xff0C46C4),
  primaryColorLight: const Color(0xff63BDBE),
  secondaryHeaderColor: const Color(0xff63BDBE),
  disabledColor: const Color(0xff121212),
  hintColor: const Color(0xff7B7676),
  focusColor: const Color(0xffFFE9D4),
  splashColor: Color(0xff53DD50),
  canvasColor: Color(0xffD72D2D),
  hoverColor: Color(0xffF6B546),
  highlightColor: Color(0xffFBF8FA),
  shadowColor: const Color(0xffcbc2c2),
  dividerColor: Color(0xffE3D4D4),
  indicatorColor: Color(0xff489FF3),
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      // primary: Color(0xffFFE9D4),
      primary: Colors.blueAccent,
      // onPrimary: Color(0xffFFE9D4),
      onPrimary: Colors.blueAccent,
      // brounColoron: Color(0xffFFD68F),
      secondary: Color(0xffD3F3FE),
      onSecondary: Color(0xffDAEBFF),
      error: Color(0xffDBCECE),
      onError: Color(0xffFDFDFD),
      surface: Color(0xffEFEBEB),
      onSurface: Color(0xff121212)),
);

BoxShadow customBoxShadow({
  Color color = Colors.black26,
  double blurRadius = 4,
  Offset offset = const Offset(0, 4),
}) {
  return BoxShadow(
    color: color,
    blurRadius: blurRadius,
    offset: offset,
  );
}
