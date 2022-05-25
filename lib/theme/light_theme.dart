import 'package:flutter/material.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';

ThemeData light = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: ColorResources.redgradient2,
  brightness: Brightness.light,
  accentColor: Colors.white,
  hintColor: Color(0xFF9E9E9E),
  focusColor: Color(0xFFc7c7c7),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
