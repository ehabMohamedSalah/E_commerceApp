import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/data_layer/model/GetCartResponse/CartItemModel.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/utils/assets_manager.dart';
 import '../Cart_ViewModel/cart_view_model_cubit.dart';

class CartItemWidget extends StatelessWidget {
  CartItemModel cartModel;
  CartItemWidget(this.cartModel);

  @override
  Widget build(BuildContext context) {
    int counter=1;
    return BlocProvider(
      create: (context) => getIt<CartViewModel>(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(

          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: Colors.black,
                )
              ),
              child: CachedNetworkImage(
                width: 120.w,
                height: 113.h,
                imageUrl: cartModel.product?.imageCover??"",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                        ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(cartModel.product?.title??"",style: Theme.of(context).textTheme.labelLarge?.copyWith(overflow: TextOverflow.ellipsis, ),)),
                    BlocConsumer<CartViewModel,CartViewModelState>(
                      listenWhen: (previous, current) {
                        if (current is DeleteCartSuccess ||
                            current is DeleteCartError ||
                            current is DeleteCartLoading
                       //  ||current is CartSuccessStatee
                        ) {
                          return true;
                        }
                        return false;
                      },
                        buildWhen: (previous, current) {
                          if (current is DeleteCartSuccess ||
                              current is DeleteCartError ||
                              current is DeleteCartLoading) {
                            return true;
                          }
                          return false;
                        },
                      listener: (context, state) {
                        if (state is DeleteCartSuccess && state.ProductId==cartModel.product?.id) {
                          Fluttertoast.showToast(
                              msg: "delete is Success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);

                          CartViewModel.get(context)..GetCard();
                        }
                        if (state is DeleteCartError && state.ProductId==cartModel.product?.id) {
                          Fluttertoast.showToast(
                              msg: state.ErrorMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }

                      },
                        builder: (context, state) {
                        if(state  is DeleteCartLoading ){
                          return Center(child: CircularProgressIndicator());
                        }
                          return InkWell(
                            onTap: (){
                                CartViewModel.get(context)..DelCartItem(ProductId: cartModel.product?.id??"",);
                            },
                            child: SvgPicture.asset(assetManagerr.delete,width: 25.w,colorFilter: ColorFilter.mode(Colors.black,  BlendMode.srcIn),
                            ),
                          );
                        },
                    )
                  ],
                ),
                SizedBox(height: 13.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text( "EGP ${cartModel.price}",style: Theme.of(context).textTheme. labelLarge,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Padding(
                        padding:   REdgeInsets.all(4.0),
                        child: BlocConsumer<CartViewModel,CartViewModelState>(

                          listener: (context, state) {
                            if(state is AddToCartSuccess2){
                               CartViewModel.get(context).addToCart(productId: state.ProductId);
                            }

                          },
                          builder: (BuildContext context, CartViewModelState state) {
                            if(state is AddToCartLoading2){
                              return Center(child: CircularProgressIndicator(color: Colors.white,),);

                            }

                            return  Row(
                              children: [
                                SvgPicture.asset(assetManagerr.subtract,width: 20.w,colorFilter: ColorFilter.mode(Colors.white,  BlendMode.srcIn),),
                                SizedBox(width: 10,),
                                Text(
                                  "${cartModel.count}",style: TextStyle(color: Colors.white),),
                                SizedBox(width: 10,),
                                InkWell(
                                    onTap: (){
                                      counter++;
                                       CartViewModel.get(context)..GetCard();

                                    },
                                    child: SvgPicture.asset(assetManagerr.add,width: 20.w,colorFilter: ColorFilter.mode(Colors.white,  BlendMode.srcIn))),

                              ],
                            );
                          },

                        ),
                      ),
                    ),
                ],),
              ],),
            ),

          ],
        ),
      ),
    );
  }
}
