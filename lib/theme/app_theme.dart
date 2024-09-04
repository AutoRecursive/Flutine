import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor primaryColor = Colors.cyan;
  static const Color textColor = Colors.white;
  static const Color backgroundColor = Colors.white;
  static const Color dialogBackgroundColor = Colors.white;
  static const Color dialogContentColor = Colors.black;

  static ThemeData get lightTheme => ThemeData(
        primarySwatch: primaryColor,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: primaryColor,
          iconTheme: const IconThemeData(color: textColor),
          toolbarTextStyle: const TextTheme(
            bodyMedium: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).bodyMedium,
          titleTextStyle: const TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          foregroundColor: textColor,
        ),
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all(primaryColor),
          checkColor: WidgetStateProperty.all(textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: dialogBackgroundColor,
          titleTextStyle: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: TextStyle(
            color: dialogContentColor,
            fontSize: 16,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: backgroundColor,
          labelStyle: TextStyle(color: primaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: textColor,
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor,
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      );
}
