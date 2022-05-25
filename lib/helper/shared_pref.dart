import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  static Future<bool> isFirstTime() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstTime",false);

  }
  static Future<bool> isRegistered() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isRegistered",true);

  }

  static Future<bool> isRegisteredStatus() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isRegistered");
  }
}