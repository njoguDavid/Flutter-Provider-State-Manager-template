import 'package:flutter/material.dart';
import 'package:FlutterArchitecture/util/color_resources.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: ColorResources.redgradient2,
  brightness: Brightness.dark,
  accentColor: Color(0xFF252525),
  hintColor: Color(0xFFc7c7c7),
  focusColor: Color(0xFFc7c7c7),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
