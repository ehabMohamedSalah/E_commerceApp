 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors_manager.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.primaryColor,
          primary: ColorManager.primaryColor
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

        backgroundColor: ColorManager.primaryColor,
        unselectedItemColor: ColorManager.primaryColor,
      ),
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 18.sp,
              color: ColorManager.headlineColor,
              fontWeight: FontWeight.w500
          ),
          headlineMedium: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white
          ),
          labelMedium: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 18.sp
          ),
          labelSmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: ColorManager.primaryColor
          ),
        labelLarge: TextStyle(
          fontWeight:FontWeight.w500,
          fontSize: 18.sp,
          color: Color(0xff06004F),

        ),
        bodyMedium:   TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          overflow: TextOverflow.ellipsis,

      ),
      )
  );
}