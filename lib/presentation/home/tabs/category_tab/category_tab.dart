import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/presentation/home/tabs/category_tab/categoryViewModel/categoryViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categoryWidget/categoryList.dart';

class CategoryTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => getIt<CategoryViewModel>()..getCategories(),
      child: Padding(
        padding:   REdgeInsets.only(left: 15,right: 15),
        child: Column(
           children: [
             SizedBox(height: 5.h,),
             Row(children: [
        Container(
        width: 348.w,
          height: 60.h,
          child: TextField(
            onChanged: (value){
              //provide=value
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.h),borderSide: BorderSide(width: 2)),
                prefixIcon: Icon(Icons.search),
                hintText: "what do you search for?",
                hintStyle: TextStyle( fontSize: 20.h)
            ),
          ),
        ),
        SizedBox(width: 10.w,),
        Icon(Icons.shopping_cart_outlined,size: 40.h,)
        ],),
             CategoryList(),

        ]),
      ),
    );
  }
}
