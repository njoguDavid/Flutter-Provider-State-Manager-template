import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:FlutterArchitecture/provider/splash_provider.dart';
import 'package:FlutterArchitecture/view/dashboard/DashboardScreen.dart';
import 'package:FlutterArchitecture/view/dashboard/HomeTab.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:FlutterArchitecture/helper/network_info.dart';
import 'package:FlutterArchitecture/helper/permission_mngr.dart';
import 'package:FlutterArchitecture/util/images.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  SplashScreenState createState()=>SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool isFirstTime = false;
  String logo = "";

  var _visible = true;
  bool isRoot = true;

  AnimationController animationController;
  Animation<double> animation;
  StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  // delayToNavigate() async {
  //   var _duration = new Duration(seconds: 1);
  //   return new Timer(_duration, checkPermission(context));
  // }

  @override
  void initState() {

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();
    setState(() {
      _visible = !_visible;
    });
    _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
        isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        showSnackBar(isNotConnected ? "no connection" : 'connected', isNotConnected ? Colors.red : Colors.green, context);
        getUsage().then(updateValue);
    });



    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    _onConnectivityChanged.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppImages.splash_logo,
                width: animation.value * 150,
                height: animation.value * 150,
              ),
            ],
          ),
        ],
      ),
    );
  }

  get getAppLogo {}

//'assets/images/applogo.png'
  void _navigateTo() async {
    // print("provider intro ${Provider.of<SplashProvider>(context).showIntro()}");
    print("==> $isFirstTime");
    if (isFirstTime != null) {
      if (!isFirstTime) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
      } else {
        //register
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Register()));
      }
    } else {
      //welcome onboarding screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
    }
  }

  void updateValue(bool value) async {
    setState(() {
      this.isFirstTime = value;
    });
    checkPermission(context);
  }

  Future<bool> getUsage() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool("isFirstTime");
    return isFirstTime;
  }

  void checkPermission(BuildContext context)async{
    bool permission=await Permission.locationAlways.isGranted;
    Map details={
     "Location":permission,
     "GalleryCamera":await galleryCameraPermission(context,null),
      "Storage":await filePermissions(context, null)
    };

    if(permission){
      _navigateTo();

    }
    else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
    }

  }

}