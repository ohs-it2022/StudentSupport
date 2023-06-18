import 'package:flutter/material.dart';

const Color darkThemeText         = Colors.white;
const Color darkThemeBackGround1  = Color.fromRGBO(20, 20, 20, 1);
const Color darkThemeBackGround2  = Color.fromRGBO(63, 63, 63, 1);


const Color lightThemeText        = Color.fromRGBO(20, 20, 20, 1);
const Color lightThemeBackGround1 = Colors.white;
const Color lightThemeBackGround2 = Color.fromRGBO(190, 190, 190, 1);

const Color accentColor           = Color.fromRGBO(48, 130, 246, 1.0);

ColorScheme lightThemeColorScheme = ColorScheme.fromSwatch().copyWith(
  brightness: Brightness.light,
  primary: lightThemeBackGround1,
  secondary: accentColor
);
ColorScheme darkThemeColorScheme  = ColorScheme.fromSwatch().copyWith(
  brightness: Brightness.dark,
  primary: darkThemeBackGround1,
  secondary: accentColor
);

final ThemeData lightThemeData    = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightThemeColorScheme,
  textTheme: getAllStyle(lightThemeText),
  appBarTheme: const AppBarTheme(
    foregroundColor: lightThemeText
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: lightThemeText
    )
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: lightThemeBackGround1,
      foregroundColor: lightThemeText,
      minimumSize: const Size(200, 50)
    )
  )
);

final ThemeData darkThemeData   = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkThemeColorScheme,
  textTheme: getAllStyle(darkThemeText),
  appBarTheme: const AppBarTheme(
      backgroundColor: darkThemeBackGround1,
      foregroundColor: darkThemeText
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: darkThemeBackGround1,
          foregroundColor: darkThemeText
      )
  ),
);

TextTheme getAllStyle(Color themeTextColor) {
  return TextTheme(
    headlineLarge: TextStyle(color: themeTextColor),
    headlineMedium: TextStyle(color: themeTextColor),
    headlineSmall: TextStyle(color: themeTextColor),
    bodyLarge: TextStyle(color: themeTextColor),
    bodyMedium: TextStyle(color: themeTextColor),
    bodySmall: TextStyle(color: themeTextColor),
    titleLarge: TextStyle(color: themeTextColor),
    titleMedium: TextStyle(color: themeTextColor),
    titleSmall: TextStyle(color: themeTextColor)
  );
}