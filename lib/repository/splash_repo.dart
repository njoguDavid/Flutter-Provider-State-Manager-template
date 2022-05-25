import 'package:FlutterArchitecture/data/datasource/remote/dio/dio_client.dart';
import 'package:FlutterArchitecture/data/model/api_response.dart';
import 'package:FlutterArchitecture/util/app_constants.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> getConfig() async {
    // try {
    //   final response = await dioClient.get(AppConstants.CONFIG_URI);
    //   return ApiResponse.withSuccess(response);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }
  }

  void initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.INTRO)) {
      sharedPreferences.setBool(AppConstants.INTRO, true);
    }
    if (!sharedPreferences.containsKey(AppConstants.FIRST_TIME)) {
      sharedPreferences.setBool(AppConstants.FIRST_TIME, false);
    }
  }


  void disableIntro() {
    sharedPreferences.setBool(AppConstants.INTRO, false);
  }

  bool showIntro() {
    return sharedPreferences.getBool(AppConstants.INTRO);
  }


}
