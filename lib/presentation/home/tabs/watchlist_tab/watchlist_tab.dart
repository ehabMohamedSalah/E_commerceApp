import 'package:e_commerce/presentation/home/tabs/watchlist_tab/widget/Wishlist_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder:  (context, index) => WishlistWidget(
            
                ),
                separatorBuilder:  (context, index) {
                   return SizedBox(height: 10.h,);
                },
                itemCount: 3),
          ),
        ],
      ),
    );
  }
}
