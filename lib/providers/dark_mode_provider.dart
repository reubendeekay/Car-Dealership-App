import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_management/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.white,
      backgroundColor:
          isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.grey[50],
      scaffoldBackgroundColor:
          isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.grey[50],
      bottomAppBarColor:
          isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.white,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Colors.grey : Colors.grey,
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      textTheme: GoogleFonts.barlowTextTheme().copyWith(
        bodyText1: TextStyle(
            color: !isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.white),
        headline2: TextStyle(
            color: !isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.white),
        bodyText2: TextStyle(
            color: !isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.white),
        headline6: TextStyle(
            color: !isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.white),
        subtitle1: TextStyle(
            color: !isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.white),
      ),
      shadowColor: isDarkTheme ? Colors.black : Colors.grey[100],
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: isDarkTheme ? Color.fromRGBO(19, 19, 38, 1) : Colors.grey[50]),
    );
  }
}
