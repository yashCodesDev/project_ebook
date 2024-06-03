import 'package:flutter/material.dart';
import 'package:project_ebook/Config/colors.dart';

var lightTheme = ThemeData(
  useMaterial3: true,

  //  ❤️  Color style Define
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: EColors.primaryColor,
    onPrimary: EColors.backgroudColor,
    secondary: EColors.secondaryColor,
    onSecondary: EColors.backgroudColor,
    error: Colors.red,
    onError: EColors.fontColor,
    background: EColors.backgroudColor,
    onBackground: EColors.fontColor,
    surface: EColors.backgroudColor,
    onSurface: EColors.fontColor,
    onPrimaryContainer: EColors.secondLabelColor,
  ),

  // ❤️  Text Style Define
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: EColors.labelColor),
    labelMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: EColors.labelColor),
    labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: EColors.labelColor),
  ),
);
