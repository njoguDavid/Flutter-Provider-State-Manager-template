import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkInfo {
  final Connectivity connectivity;
  NetworkInfo(this.connectivity);

   Future<bool> get isConnected async {
    ConnectivityResult _result = await connectivity.checkConnectivity();
    return _result != ConnectivityResult.none;
  }

  static void checkConnectivity(BuildContext context) {
    bool _firstTime = true;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if(!_firstTime) {
        //bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
        bool isNotConnected;
        if(result == ConnectivityResult.none) {
          isNotConnected = true;
        }else {
          isNotConnected = !await _updateConnectivityStatus();
        }
        isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected ?"No Connection" :"Connected",
            textAlign: TextAlign.center,
          ),
        ));
      }
      _firstTime = false;
    });
  }

  static Future<bool> _updateConnectivityStatus() async {
     bool _isConnected=false;
     try {
       final List<InternetAddress> _result = await InternetAddress.lookup('google.com');
       if(_result.isNotEmpty && _result[0].rawAddress.isNotEmpty) {
         _isConnected = true;
       }
     }catch(e) {
       _isConnected = false;
     }
     return _isConnected;
  }
}

showSnackBar(String msg,Color color,BuildContext context){
  //  Flushbar(
  //   flushbarStyle: FlushbarStyle.FLOATING,
  //   message: msg,
  //   icon: Icon(
  //     Icons.info_outline,
  //     size: 28.0,
  //     color: color,
  //   ),
  //   duration: Duration(seconds: 3),
  //   leftBarIndicatorColor: color,
  // )..show(context)";
  return "";
}
