 import 'package:e_commerce/core/utils/routes_manager.dart';
import 'package:e_commerce/presentation/home/tabs/category_tab/category_tab.dart';
import 'package:e_commerce/presentation/home/tabs/hometab/home_tab.dart';
import 'package:e_commerce/presentation/home/tabs/profile_tab/profile_tab.dart';
import 'package:e_commerce/presentation/home/tabs/watchlist_tab/watchlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/shared_prefs/local/prefs_helper.dart';
import '../../core/utils/colors_manager.dart';
import 'homeViewModel.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});

  List<Widget> Tabs=[HomeTabs(),CategoryTab(),WatchList(),ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
        builder: (context, state)
    {
      HomeViewModel homeViewModel = HomeViewModel.get(context);

      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              PrefsHelper.clearToken();
              Navigator.pushNamedAndRemoveUntil(context, RoutesManager.SignInroute, (route) => false);
            },icon:Icon(Icons.logout,size: 40.h),),

            IconButton(onPressed: (){
              Navigator.pushNamed(context, RoutesManager.cartScreen);
            },icon:Icon(Icons.shopping_cart_outlined,size: 40.h),)

          ],
          centerTitle: true,
          title: Container(
              height: 62,
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/images/Logo.png")),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex:homeViewModel.currentIndex ,
            onTap: (newindex) {
              homeViewModel.changeIndex(newindex);
            },
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                backgroundColor: ColorManager.primaryColor,
                icon: SvgPicture.asset(
                    "assets/images/bottomNavBar/homeUnselected.svg"),
                label: "",
                activeIcon: SvgPicture.asset(
                    "assets/images/bottomNavBar/homeSelected.svg"),

              ),
              BottomNavigationBarItem(
                backgroundColor: ColorManager.primaryColor,

                icon: SvgPicture.asset(
                    "assets/images/bottomNavBar/categoryUnselected.svg"),
                label: "",
                activeIcon: SvgPicture.asset(
                    "assets/images/bottomNavBar/categorySelected.svg"),

              ),
              BottomNavigationBarItem(
                backgroundColor: ColorManager.primaryColor,
                icon: SvgPicture.asset(
                    "assets/images/bottomNavBar/watchlistUnselected.svg"),
                label: "",
                activeIcon: SvgPicture.asset(
                    "assets/images/bottomNavBar/watchlistSelected.svg"),

              ),
              BottomNavigationBarItem(
                backgroundColor: ColorManager.primaryColor,
                icon: SvgPicture.asset(
                    "assets/images/bottomNavBar/profileUnselected.svg"),
                label: "",
                activeIcon: SvgPicture.asset(
                    "assets/images/bottomNavBar/profileSelected.svg"),

              ),


            ]

        ),
        body: Tabs[homeViewModel.currentIndex],

      );
    });
}
}