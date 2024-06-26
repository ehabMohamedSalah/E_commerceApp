import 'package:e_commerce/Domain/entity/Categories_entity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
 CategoryEntity category;
 CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return  Column(
     children: [
     CachedNetworkImage(
         imageUrl: category.image ??"",
         errorWidget: (context, url, error) => Icon(Icons.error,size: 25.sp,),
         placeholder: (context, url) => Center(child: CircularProgressIndicator()),
         imageBuilder: (context, imageProvider) {
           return CircleAvatar(
             radius: 28,
               backgroundImage:imageProvider ,
           );
       },
     ),
       SizedBox(height: 8.h,),
       Text(category.name??"",maxLines: 1,overflow: TextOverflow.ellipsis,)
   ],
    );
  }
}
