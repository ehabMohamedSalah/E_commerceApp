import 'package:e_commerce/Domain/entity/BrandEntity.dart';
import 'package:e_commerce/Domain/entity/Categories_entity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandWidget extends StatelessWidget {
  BrandEntity brands;
  BrandWidget(this.brands);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CachedNetworkImage(
          imageUrl: brands.image ??"",
          errorWidget: (context, url, error) => Icon(Icons.error,size: 25.sp,),
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          imageBuilder: (context, imageProvider) {
            return Container(
              height: 80.h,
              width: 100.h,
              decoration: BoxDecoration(image: DecorationImage(image: imageProvider) ),
            );
          },
        ),
        SizedBox(height: 8.h,),
        Text(brands.name??"",maxLines: 1,overflow: TextOverflow.ellipsis,)
      ],
    );
  }
}
