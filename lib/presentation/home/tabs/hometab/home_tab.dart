import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/utils/strings_manager.dart';
import 'package:e_commerce/presentation/home/tabs/hometab/view_model/HomeTab.dart';
import 'package:e_commerce/presentation/home/tabs/hometab/widget/brandsList.dart';
 import 'package:e_commerce/presentation/home/tabs/hometab/widget/categorylist_widget.dart';
import 'package:e_commerce/presentation/home/tabs/hometab/widget/productList.dart';
import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/DI/di.dart';
import '../../../../core/utils/assets_manager.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ads=[ assetManagerr.ads1,assetManagerr.ads2,assetManagerr.ads3];

    //create object of provider
    return BlocProvider(
      create: (BuildContext context) => getIt<HomeTabViewModel>(),
      child: Padding(
        padding:   REdgeInsets.only(right: 15,left: 15,bottom: 15),
        child: CustomScrollView(
        slivers: [


          SliverToBoxAdapter(child: SizedBox(height: 5.h,)),
          SliverToBoxAdapter(
            child: Row(children: [
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
          ),
          SliverToBoxAdapter(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                height: 200.h,
                enlargeCenterPage: true,
            
              ),
              itemBuilder: (context, index, realIndex) => Image.asset(ads[index]),
              itemCount: ads.length,),
          ) ,
          SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey,
              height: 30.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsManger.categories,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp
                    ),
                  ),
                  Text(
                    StringsManger.viewAll,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
          SliverToBoxAdapter(
            //3shan t2dr t listen 3ala al state
            child: CategoryConsumer(),
            
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
          SliverToBoxAdapter(
            child: Container(
              height: 30.h,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsManger.brands,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp
                    ),
                  ),
                  Text(
                    StringsManger.viewAll,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: BrandsList()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
          SliverToBoxAdapter(child: Container(
              height: 30.h,
              color: Colors.grey,
              child: Text("Most Selling",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))),
          SliverToBoxAdapter(child: ProductList(),)




        ],
        ),
      ),
    );
  }
}
