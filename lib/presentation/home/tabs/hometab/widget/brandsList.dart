import 'package:e_commerce/presentation/home/tabs/hometab/view_model/HomeTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'BrandWidget.dart';

class BrandsList extends StatefulWidget {

  @override
  State<BrandsList> createState() => _BrandsListState();
}

class _BrandsListState extends State<BrandsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //3shan b3d m build awl frame ynade 3ala GetCateories
    //b3d m tbuild awl frame le al widget nade 3ala al categories
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTabViewModel>().GetBrands();
    });
  }
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabState>(
        buildWhen:  (previous, current) => current is BrandSuccessState ||current is BrandTabErrorState ||current is BrandTabErrorState,
        builder:  (context, state) {
          if(state is BrandSuccessState ){
            return   SizedBox(
              height: 250.h,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    BrandWidget(state.brands[index]),
                itemCount: state.brands.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.h,
                ),
              ),
            );;
          }
          if(state is BrandTabErrorState){
            return Center(child: Text(state.errorMessage),);
          }

          return Center(child: CircularProgressIndicator());

        },);
  }
}
