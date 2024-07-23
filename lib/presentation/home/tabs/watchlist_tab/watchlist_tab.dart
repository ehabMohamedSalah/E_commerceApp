import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/presentation/home/tabs/watchlist_tab/widget/Wishlist_Widget.dart';
import 'package:e_commerce/presentation/home/tabs/watchlist_tab/wishlist_viewmodel/wishlist_view_model_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WishlistViewModel>()..GetWishList(),
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<WishlistViewModel,WishlistViewModelState>(
              buildWhen: (previous, current) {
                if(current is WishlistViewModelError|| current is WishlistViewModelSuccess || current is WishlistViewModelLoading){
                  return true;
                }return false;
              },
              builder: (context, state) {
                if(state is WishlistViewModelError){
                  Center(child: Text(state.errorMessage));
                }
                if(state is WishlistViewModelSuccess){
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder:  (context, index) => WishlistWidget(
                          state.products[index],
                        ),
                        separatorBuilder:  (context, index) {
                          return SizedBox(height: 4.h,);
                        },
                        itemCount: state.products.length),
                  );
                }
                return Center(child: CircularProgressIndicator(color: Colors.black,));
              },

            ),
          ],
        ),
      ),
    );
  }
}
