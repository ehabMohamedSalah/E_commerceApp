import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/data_layer/model/GetCartResponse/CartItemModel.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/assets_manager.dart';
 import '../Cart_ViewModel/cart_view_model_cubit.dart';

class CartItemWidget extends StatefulWidget {
  CartItemModel cartModel;
  CartItemWidget(this.cartModel);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
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
                imageUrl: widget.cartModel.product?.imageCover??"",
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
                        child: Text(widget.cartModel.product?.title??"",style: Theme.of(context).textTheme.labelLarge?.copyWith(overflow: TextOverflow.ellipsis, ),)),
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(assetManagerr.delete,width: 25.w,colorFilter: ColorFilter.mode(Colors.black,  BlendMode.srcIn),)),
                  ],
                ),
                SizedBox(height: 13.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text( "EGP ${widget.cartModel.price}",style: Theme.of(context).textTheme. labelLarge,),
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
                                  "${widget.cartModel.count}",style: TextStyle(color: Colors.white),),
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
