import 'package:flutter/material.dart';

// Define the primary color as a MaterialColor to accommodate different shades
Map<int, Color> color = {
  50: const Color.fromRGBO(178, 128, 181, .1),
  100: const Color.fromRGBO(178, 128, 181, .2),
  200: const Color.fromRGBO(178, 128, 181, .3),
  300: const Color.fromRGBO(178, 128, 181, .4),
  400: const Color.fromRGBO(178, 128, 181, .5),
  500: const Color.fromRGBO(178, 128, 181, .6),
  600: const Color.fromRGBO(178, 128, 181, .7),
  700: const Color.fromRGBO(178, 128, 181, .8),
  800: const Color.fromRGBO(178, 128, 181, .9),
  900: const Color.fromRGBO(178, 128, 181, 1),
};

MaterialColor primaryColorCustom = MaterialColor(0xFFB280B5, color);

ThemeData buduarTheme = ThemeData(
  primarySwatch: primaryColorCustom,
  fontFamily: 'PlayfairDisplay',
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.grey[200],
      toolbarHeight: 35,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
        letterSpacing: 2,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 20,
      )),
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.yellow),
    bodyMedium: TextStyle(color: Colors.black),
    bodyLarge: TextStyle(color: Colors.red),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColorCustom,
    foregroundColor: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: primaryColorCustom,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  ),
);
