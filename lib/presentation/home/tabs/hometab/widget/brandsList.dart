import 'package:e_commerce/core/DI/di.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../view_model/Brand_viewModel.dart';
import 'BrandWidget.dart';

class BrandsList extends StatefulWidget {

  @override
  State<BrandsList> createState() => _BrandsListState();
}

class _BrandsListState extends State<BrandsList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BrandViewModel>()..GetBrands(),
      child: BlocBuilder<BrandViewModel,BrandState>(
          buildWhen:  (previous, current) {
            if(current is BrandSuccessStatee || current is BrandErrorState ||current is BrandLoadingState){
              return true;
            }
            return false;
          },
          builder:  (context, state) {

            if(state is BrandSuccessStatee ){
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
              );
            }
            if(state is BrandErrorState){
              return Center(child: Text(state.errorMessage),);
            }

            return Center(child: CircularProgressIndicator());

          },),
    );
  }
}
