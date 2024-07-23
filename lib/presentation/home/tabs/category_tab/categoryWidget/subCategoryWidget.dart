import 'package:e_commerce/Domain/entity/ProductEntity/SubcategoryEntity.dart';
import 'package:e_commerce/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryWidget extends StatelessWidget {
SubcategoryEntity subcategoryEntity;
SubCategoryWidget(this.subcategoryEntity);
  @override
  Widget build(BuildContext context) {
    return
       Column(
        children: [
        Container(
            height: 70.h,
            width: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Theme.of(context).primaryColor,

          ),

            child: Image.asset("assets/images/route.png")),
          SizedBox(height:8.h ,),
          Text(subcategoryEntity.name??"",maxLines: 1,overflow: TextOverflow.ellipsis,),
        ],
    );
  }
}
