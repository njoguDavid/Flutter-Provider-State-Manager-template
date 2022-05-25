import 'package:FlutterArchitecture/provider/splash_provider.dart';
import 'package:FlutterArchitecture/view/dashboard/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:FlutterArchitecture/provider/location_provider.dart';
import 'package:FlutterArchitecture/provider/theme_provider.dart';
import 'package:FlutterArchitecture/util/app_constants.dart';
import 'package:FlutterArchitecture/view/splash/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //initializeFirebase();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LocationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      home: SplashScreen(),
      routes: {
        '$dashboardRoute': (context) =>  DashboardScreen()
      },
    );
  }
}


initializeFirebase() async {
  // await Firebase.initializeApp();
  //
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // Function originalOnError = FlutterError.onError;
  // FlutterError.onError = (FlutterErrorDetails errorDetails) async {
  //   await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  //   originalOnError(errorDetails);
  // };
}
