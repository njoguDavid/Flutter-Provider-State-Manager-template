import 'package:FlutterArchitecture/repository/splash_repo.dart';
import 'package:flutter/material.dart';


class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;
  SplashProvider({@required this.splashRepo});


  bool _hasConnection = true;
  bool _fromSetting = false;
  bool _firstTimeConnectionCheck = true;

  bool get hasConnection => _hasConnection;
  bool get fromSetting => _fromSetting;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  Future<bool> initConfig(BuildContext context) async {
    _hasConnection = true;

  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }


  void initSharedPrefData() {
    splashRepo.initSharedData();
  }

  void setFromSetting(bool isSetting) {
    _fromSetting = isSetting;
  }

  bool showIntro() {
    return splashRepo.showIntro();
  }

  void disableIntro() {
    splashRepo.disableIntro();
  }


}
