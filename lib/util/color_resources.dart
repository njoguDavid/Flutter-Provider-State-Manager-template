import 'package:flutter/material.dart';
import 'package:FlutterArchitecture/provider/theme_provider.dart';
import 'package:provider/provider.dart';
class ColorResources {
  static Color redgradient2 = Color(0xffFF4437);
  static Color orangeTheme = Color(0xfff79f21);
  static Color onBoardingBg = Color(0xff7f8f8);
  static Color containerColour= Color(0xFFFDE1D7);

  static Color getTextBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFF3F9FF) : Color(0xFF414345);
  }

  static Color normalTextbg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Color(0xFF414345)  : Color(0xFFF3F9FF);
  }

  static Color hintTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFF3F9FF) : Color(
        0xFF737474);
  }

  static Color containerBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Color(0xFF414345)  : Color(
        0xfffffff);
  }
  static Color iconColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Colors.white : Colors.black ;
  }
  static Color appbarIconColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Colors.white : Colors.white ;
  }
  static Color appbarColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Color(0xFF414345)  : redgradient2;
  }
  static Color homeContainerBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Color(0xFF414345)  : containerColour;
  }

  static Color selectedTabColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Color(0xFFF4E4CE)  : Color(0xfff79f21);
  }

  static Color bgColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Color(0xFF414345)  : Color(
        0xFFFAF3F1);
  }

  static Color buttonColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Color(0xFF414345)  : redgradient2;
  }

  static Color leadingColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Colors.white : Color(
        0xFF737474);
  }

  static Color appbarOptionsBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Colors.grey.shade500  : Color(0xfff79f21);
  }
  static Color appbarSplashbg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ?Colors.grey.shade700  : Color(
        0xfff76c21);
  }



}

