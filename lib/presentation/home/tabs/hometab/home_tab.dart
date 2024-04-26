import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/utils/strings_manager.dart';
import 'package:e_commerce/presentation/home/tabs/hometab/view_model/HomeTab.dart';
import 'package:e_commerce/presentation/home/tabs/hometab/widget/category_widget.dart';
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
    List<String> ads=[ assetManager.ads1,assetManager.ads2,assetManager.ads3];
    return BlocProvider(
      create: (BuildContext context) => getIt<HomeTabViewModel>(),
      child: Padding(
        padding:   REdgeInsets.all(15.0),
        child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 40.h,)),
          SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.centerLeft,
                child: Image.asset(assetManager.route)),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h,)),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManger.categories,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
          SliverToBoxAdapter(
            //3shan t2dr t listen 3ala al state
            child: BlocConsumer<HomeTabViewModel,HomeTabState>(

              listenWhen: (previous, currentState) {
                if(currentState is HomeTabLoadingState || currentState is HomeTabErrorState){
                  return true;
                }
                return false;
              },
              listener: (  context,  state) {
                if(state is  HomeTabLoadingState ){
                  showDialog(context: context, builder:  (context) {
                    return AlertDialog(
                      content: Center(child: CircularProgressIndicator()),
                    );
                  },);
                }
                if(state is HomeTabErrorState){
                  showDialog(context: context, builder:  (context) {
                    return AlertDialog(
                      content:Text(state.errorMessage),
                    );
                  },);
                 }
              },

              buildWhen: (previous, current) {
                if(current is HomeSuccessState){
                  return true;//mtro7sh t build
                }
                return false;
              },
              builder: (  context, state) {
                if(state is  HomeSuccessState ){
                return SizedBox(
                  height: 288.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                      itemBuilder:(context, index) =>CategoryWidget(state.categories[index]) ,
                      itemCount:state.categories.length,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.h,

                      ) ,
                  ),
                );
                }
                return Center(child: CircularProgressIndicator());
              },

            ),)




        ],
        ),
      ),
    );
  }
}
