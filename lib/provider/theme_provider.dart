import 'package:flutter/foundation.dart';
import 'package:FlutterArchitecture/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  ThemeProvider({@required this.sharedPreferences}) {
    FlutterArchitecture();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(AppConstants.THEME, _darkTheme);
    notifyListeners();
  }

  void FlutterArchitecture() async {
    _darkTheme = sharedPreferences.getBool(AppConstants.THEME) ?? false;
    notifyListeners();
  }
}
