import 'package:e_commerce/congfig/theme/appTheme.dart';
 import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:e_commerce/presentation/signin_user/signin.dart';
import 'package:e_commerce/presentation/signup_user/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/shared_prefs/local/prefs_helper.dart';
import 'core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return     MaterialApp(
          debugShowCheckedModeBanner: false,
          routes:{
            RoutesManager.HomeRoutes:(context) => HomeScreen(),
            RoutesManager.SignInroute:(context) => SignIn(),
            RoutesManager.SignUproute:(context) => SignUp(),
          },
          initialRoute: PrefsHelper.getToken().isNotEmpty?RoutesManager.HomeRoutes:RoutesManager.SignInroute,
          theme:AppTheme.lightTheme ,

        );
      },
    ) ;

  }
}