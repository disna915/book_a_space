import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:traveller_app/constants/app_strings.dart';
import 'package:traveller_app/core/auth/login/view/login_screen.dart';

import 'package:traveller_app/responsive/responsive.dart';
import 'package:traveller_app/shared/controllers/theme_controller.dart';
import 'package:traveller_app/shared/dependency_injection/dependency_injection.dart';
import 'package:traveller_app/core/splash_view/view/splash_screen.dart';
import 'package:traveller_app/utils/auth_services.dart';
import 'package:traveller_app/utils/services/local_storage/flutter_secure_storage.dart';
import 'config/color.dart';
import 'config/routes.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const FlutterSecureStorage pref = FlutterSecureStorage();
  final String? isLoggedInValue = await pref.read(key: 'isLoggedInKey');
  final String? userTypeValue = await pref.read(key: 'userTypeKey');
  print("isLoggedInValue"+isLoggedInValue.toString());
  print("userTypeValue"+userTypeValue.toString());
  HttpOverrides.global = MyHttpOverrides();

  //final String? isLoggedInValue = await PersistentStorage.read(isLoggedInKey);
  //final String? userTypeValue = await PersistentStorage.read(userTypeKey);
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..userInteractions = false
    ..dismissOnTap = false;
  DependencyInjection.init();




  String initialRoute = '/loginPage';
  // if (isLoggedInValue == "true") {
  //   switch (userTypeValue) {
  //     case "0":
  //       initialRoute = '/coordinatorDashboard';
  //       break;
  //     case "1":
  //       initialRoute = '/travellerDashboard';
  //       break;
  //     case "2":
  //       initialRoute = '/transporterDashboard';
  //       break;
  //     default:
  //       initialRoute = '/loginPage';
  //   }
  // }

  runApp(MyApp(

    intialRoutes: initialRoute,

    isLoggedInValue: isLoggedInValue,
    userTypeValue: userTypeValue,
  ));
}
// Utility
DateTime currentTime() => DateTime.now();
var logger = Logger(printer: PrettyPrinter());

class MyApp extends StatefulWidget {
  final String? isLoggedInValue;
  final String? userTypeValue;
  final String? intialRoutes;

  const MyApp({
    super.key,
    this.isLoggedInValue,
     this.userTypeValue,
    this.intialRoutes
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    String? initialRoute;
    bool? loggedIn;

  @override
  void initState() {
    super.initState();
    checkLogin();



  }
   void checkLogin() async {
      loggedIn = await AuthService.isLoggedIn();
     print("loggedIn$loggedIn");
     if (loggedIn==true) {
       initialRoute = '/travellerDashboard';


     } else {
       initialRoute = '/loginPage';
     }
      setState(() {});
   }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    if (loggedIn == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return LayoutBuilder(
      builder: (contextTwo, constraints) {
        return OrientationBuilder(
          builder: (contextThree, orientation) {
            print("ddfrfr"+loggedIn.toString());
            Responsive().init(constraints, orientation);
            return GetBuilder<ThemeController>(
              init: ThemeController(),
              builder: (controller) {
                return GetMaterialApp(
                  title: 'Traveller App',
                  debugShowCheckedModeBanner: false,
                  builder: (context, child) {
                    child = EasyLoading.init()(context, child);
                    return child;
                  },
                  navigatorKey: Routes.key,
                  initialRoute: initialRoute,

                  theme: ThemeData(
                      primaryColor: AppColor.primary,
                      textTheme: GoogleFonts.poppinsTextTheme(
                        Theme.of(context).textTheme,
                      ),
                      scaffoldBackgroundColor: AppColor.white),

                  getPages: [
                    GetPage(name: '/splashRoute', page: () => SplashScreen()),

                    GetPage(name: '/loginPage', page: () => LoginScreen()),



                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
