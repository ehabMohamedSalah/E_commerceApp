import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain/entity/ProductEntity/ProductEntity.dart';
import 'package:e_commerce/presentation/home/tabs/hometab/view_model/HomeTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductWidget extends StatelessWidget {
  ProductEntity product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      decoration: BoxDecoration(
        border: Border.all(width: 2.w, color: Color(0xff004182)),
        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.sp),
                    topLeft: Radius.circular(15.sp)),
                child: CachedNetworkImage(
                  width: 191.w,
                  height: 128.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? "",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              BlocConsumer<HomeTabViewModel, HomeTabState>(
                listenWhen: (previous, current) {
                  if(current is AddToWishListLoading || current is AddToWishListError|| current is AddToWishListSuccess){
                    return true;
                  }return false;
                },
                buildWhen: (previous, current) {
                  if(current is AddToWishListLoading || current is AddToWishListError|| current is AddToWishListSuccess){
                    return true;
                  }return false;
                },
                listener: (BuildContext context, HomeTabState state) {
                  if (state is AddToWishListSuccess && state.ProductId==product.id) {
                    Fluttertoast.showToast(
                        msg: state.wishlistEntity.message ?? "",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (state is AddToWishListError && state.ProductId==product.id) {
                    Fluttertoast.showToast(
                        msg: state.ErrorMessage,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                builder: (BuildContext context, HomeTabState state) {
                  if(state is AddToWishListLoading && state.ProductId==product.id){
                    return SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: Center(child: CircularProgressIndicator(color: Colors.black87,),));
                  }
                  return InkWell(
                    onTap: () {
                      HomeTabViewModel.get(context).addToWishList(productId: product.id ?? "");

                    },
                    child: SvgPicture.asset(
                      "assets/images/like.svg",
                      height: 60.h,
                      width: 30.w,

                    ),
                  );
                },

              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "${product.title ?? ""}\n",
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          product.priceAfterDiscount == null
              ? Text("EGP${product.price}")
              : Row(
                  children: [
                    Text("EGP${product.priceAfterDiscount}"),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      "${product.price} EGP",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
          SizedBox(
            height: 8.h,
          ),
          Row(children: [
            Text("Review(${product.ratingsAverage})"),
            SvgPicture.asset("assets/images/star_.svg"),
            Spacer(),
            BlocConsumer<HomeTabViewModel, HomeTabState>(
              buildWhen: (previous, current) {
                if (current is AddToCartError ||
                    current is AddToCartSuccess ||
                    current is AddToCartLoading) {
                  return true;
                }
                return false;
              },
              listenWhen: (previous, current) {
                if (current is AddToCartError ||
                    current is AddToCartSuccess ||
                    current is AddToCartLoading) {
                  return true;
                }
                return false;
              },
              listener: (BuildContext context, state) {
                if (state is AddToCartSuccess && state.ProductId==product.id) {
                  Fluttertoast.showToast(
                      msg: state.cartResponseEntity.message ?? "",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                if (state is AddToCartError && state.ProductId==product.id) {
                  Fluttertoast.showToast(
                      msg: state.ErrorMessage,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              builder: (context, state) {
                if(state is AddToCartLoading && state.ProductId==product.id){
                  return SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Center(child: CircularProgressIndicator(color: Colors.black87,),));
                }
                return GestureDetector(
                    onTap: () {
                      HomeTabViewModel.get(context).addToCart(productId: product.id ?? "");

                    },
                    child: SvgPicture.asset(
                      "assets/images/plus.svg",
                      height: 30.h,
                      width: 30.w,
                    ));
              },
            )
          ]),
        ],
      ),
    );
  }
}
