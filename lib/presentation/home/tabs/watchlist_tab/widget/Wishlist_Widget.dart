import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/presentation/home/tabs/watchlist_tab/wishlist_viewmodel/wishlist_view_model_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Domain/entity/wishlist/get_wishlist_entity/ProductEntityWish.dart';
import '../../../../../core/utils/assets_manager.dart';

class WishlistWidget extends StatefulWidget {
  ProductEntityResponse products;

  WishlistWidget(this.products);

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {


  @override
  Widget build(BuildContext context) {
    WishlistViewModel wishlistViewModel = WishlistViewModel.get(context);

    bool isClick=wishlistViewModel.isclick;
    return Padding(
      padding: REdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2))
        ),
            child:Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2))
                    ),

                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(19),
                      child: CachedNetworkImage(
                        width: 191.w,
                        height: 128.h,
                        fit: BoxFit.cover,
                        imageUrl: widget.products.imageCover ?? "",
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:2,
                              child: Text(widget.products.title??"",style: Theme.of(context).textTheme.bodyMedium,)),
                         InkWell(
                           onTap: () {
                             isClick=!isClick;
                             wishlistViewModel.isClicked(isClick);
                             print(isClick);
                           },
                              child: isClick==false?SvgPicture.asset(assetManagerr.love,):SvgPicture.asset(assetManagerr.like,)
                         )
                ])
,                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("${widget.products.price}",style:Theme.of(context).textTheme.bodyMedium),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                            onPressed: (){},
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp
                              ),
                            ))
                      ],)
                    ],
                  ),
                )

              ],
            ) ,
        ),
    );
  }
}
