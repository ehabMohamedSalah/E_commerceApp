import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resuable_component/product_widget.dart';
import '../view_model/HomeTab.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeTabViewModel>().GetProduct();
  }
  @override

  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabState>(
      buildWhen: (previous, current) {
        if(current is ProductErrorState || current is ProductSuccessState || current is ProductLoadingState){
          return true;
        }
        return false;
      },

        builder: (context, state) {
          if(state is ProductSuccessState){
            return SizedBox(
              height: 260.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductWidget(state.products[index]),
                  separatorBuilder:  (context, index) => SizedBox(width: 16.w,),
                  itemCount: state.products.length),
            );
          }
          if(state is ProductErrorState){
            return Center(child: Text("${state.errorMessage}"),);
          }
          return Center(child: CircularProgressIndicator());
        },);
  }
}
