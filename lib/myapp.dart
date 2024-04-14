import 'package:e_commerce/congfig/theme/appTheme.dart';
import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          routes:{
            RoutesManager.HomeRoutes:(context) => HomeScreen(),
          },
          initialRoute: RoutesManager.HomeRoutes,
          theme:AppTheme.lightTheme ,

        );
      },
    ) ;

  }
}