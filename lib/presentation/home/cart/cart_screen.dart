
import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/data_layer/model/cart_response/CartModel.dart';
import 'package:e_commerce/presentation/home/cart/widget/cartItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/routes_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../../../payment_getway/feature/checkout/presentation/provider.dart';
import '../../../payment_getway/feature/checkout/presentation/views/my_cart_view.dart';
import 'Cart_ViewModel/cart_view_model_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider provider= Provider.of<SettingProvider>(context);

    return BlocProvider(
      create: (context) => getIt<CartViewModel>()..GetCard(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(StringsManger.cart),
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pushNamed(context, RoutesManager.HomeRoutes);
            } , icon: Icon(Icons.arrow_back)),
          ),
        body: Padding(
          padding:   REdgeInsets.all(12.0),
          child: BlocConsumer<CartViewModel,CartViewModelState>(
            builder: (context, state) {
              if(state is CartSuccessStatee){
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder:  (context, index) => CartItemWidget(state.cart.data!.products![index]  ),
                          separatorBuilder:  (context, index) => SizedBox(height: 10.h,),
                          itemCount: state.cart.data?.products?.length??0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(StringsManger.totalPrice,style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w300),),
                            Text("EGP ${state.cart.data?.totalCartPrice}",style: Theme.of(context).textTheme.labelLarge,),

                          ],
                        ),
                        ElevatedButton(
                            style:ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor) ,
                            onPressed: (){
                              provider.changePrice(state.cart.data?.totalCartPrice??0);
                              Navigator.pushNamed(context, RoutesManager.cartView,arguments: state.cart.data);
                            }, child: Row(children: [
                          Text(StringsManger.checkOut,style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),),
                          Icon(Icons.arrow_forward,color: Colors.white,),
                        ],))
                      ],),
                    SizedBox(height: 98.h,)
                  ],
                );
              }
              if(state is CartErrorState){
                return Center(child: Text(state.errorMessage),);
              }
              return (Center(child: CircularProgressIndicator(),));
            }, listener: (BuildContext context, CartViewModelState state) {  },

          ),
        ),
      ),
    );
  }
}
