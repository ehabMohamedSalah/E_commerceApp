import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain/entity/ProductEntity/ProductEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
ProductEntity product;
ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 191.w,
      decoration: BoxDecoration(
       border: Border.all(width: 2.w,color:Color(0xff004182) ),
        borderRadius: BorderRadius.all(   Radius.circular(15.sp) ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15.sp),topLeft: Radius.circular(15.sp)),
              child: CachedNetworkImage(
                width: 191.w,
                height: 128.h,
                fit: BoxFit.cover,
                imageUrl:product.imageCover??"" ,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SvgPicture.asset("assets/images/like.svg",height: 30.h,width: 30.w,),
          ],),
          SizedBox(height: 8.h,),
          Text("${product.title??""}\n",  maxLines: 2,style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            overflow:TextOverflow.ellipsis ,
          ),),
          SizedBox(height: 8.h,),
          product.priceAfterDiscount==null? Text("EGP${product.price}")
              : Row(children: [
          Text("EGP${product.priceAfterDiscount}") ,
            SizedBox(width: 16.w,),
            Text("${product.price} EGP",style: TextStyle(decoration: TextDecoration.lineThrough),)
          ],) ,
          SizedBox(height: 8.h,),
          Row(
            children: [
              Text("Review(${product.ratingsAverage})"),
              SvgPicture.asset("assets/images/star_.svg"),
              Spacer(),
              SvgPicture.asset("assets/images/plus.svg"),
            ],
          ),

        ],),

    );
  }
}
