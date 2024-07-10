import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets_manager.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Row(
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(assetManagerr.dumyShoas,height: 113.h,)),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nike Air Jordon",style: Theme.of(context).textTheme.bodyMedium,),
                      SvgPicture.asset(assetManagerr.love,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("EGP 1200",style:Theme.of(context).textTheme.bodyMedium),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                        onPressed: (){},
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp
                          ),
                        ))
                  ],)
                ],
              ),
            )
            
          ],
        ) ,
    );
  }
}
