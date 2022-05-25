import 'package:dio/dio.dart';
import 'package:FlutterArchitecture/repository/splash_repo.dart';

import 'package:get_it/get_it.dart';
import 'package:FlutterArchitecture/helper/network_info.dart';
import 'package:FlutterArchitecture/provider/location_provider.dart';
import 'package:FlutterArchitecture/provider/theme_provider.dart';
import 'package:FlutterArchitecture/repository/location_updates.dart';
import 'package:FlutterArchitecture/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LocationProvider(locationUpdatesRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  //sl.registerLazySingleton(() => Connectivity());

  //screens
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
}
