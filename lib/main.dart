import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftl_dery/pages/auth/login_controller.dart';
import 'package:ftl_dery/pages/auth/sign_in.dart';
import 'package:ftl_dery/pages/home/home_page.dart';
import 'package:ftl_dery/pages/splash_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController authController = Get.put(LoginController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
        designSize: const Size(375, 719),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
              // translations: MyTranslation(),
              locale: Locale("US"),
              // title: 'Derry FTL',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.white),
              ),
              home: Obx(() {
                // Jika user sudah login, arahkan ke HomeScreen
                return authController.isLoggedIn.value
                    ? HomePage()
                    : SplashPage();
              }));
        });
  }
}
