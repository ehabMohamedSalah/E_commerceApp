import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/presentation/home/tabs/watchlist_tab/wishlist_viewmodel/wishlist_view_model_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../Domain/entity/wishlist/get_wishlist_entity/ProductEntityWish.dart';
import '../../../../../core/DI/di.dart';
import '../../../../../core/utils/assets_manager.dart';

class WishlistWidget extends StatelessWidget {
  ProductEntityResponse products;
  WishlistWidget(this.products);

  @override
  Widget build(BuildContext context) {

    bool visible=false;
    return Padding(
      padding: REdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.2))),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                        color:
                            Theme.of(context).primaryColor.withOpacity(0.2))),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(19),
                  child: CachedNetworkImage(
                    width: 191.w,
                    height: 128.h,
                    fit: BoxFit.cover,
                    imageUrl: products.imageCover ?? "",
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
                            flex: 2,
                            child: Text(
                              products.title ?? "",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )),
                        BlocConsumer<WishlistViewModel,
                            WishlistViewModelState>(
                          buildWhen: (previous, current) {
                            if (current is DeleteWishlistViewModelSuccess ||
                                current is DeleteWishlistViewModelError ||
                                current is DeleteWishlistViewModelLoading) {
                              return true;
                            }
                            return false;
                          },
                          listenWhen: (previous, current) {
                            if (current is DeleteWishlistViewModelSuccess ||
                                current is DeleteWishlistViewModelError ||
                                current is DeleteWishlistViewModelLoading) {
                              return true;
                            }
                            return false;
                          },
                          listener: (context, state) {
                            if (state is DeleteWishlistViewModelSuccess && state.productId==products.id) {
                              Fluttertoast.showToast(
                                  msg: "delete is Success",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                               WishlistViewModel.get(context)..GetWishList();


                            }
                            if (state is DeleteWishlistViewModelError && state.productId==products.id) {
                              Fluttertoast.showToast(
                                  msg: state.errorMessage,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          builder: (context, state) {
                            if (state is DeleteWishlistViewModelLoading && state.productId==products.id) {
                              Center(child: CircularProgressIndicator());
                            }
                            return InkWell(
                              onTap: (){
                                WishlistViewModel.get(context)..DeleteWishList(ProductId: products.id??"");
                              },
                              child: SvgPicture.asset(
                                assetManagerr.delete,
                                width: 30,
                                height: 25,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).primaryColor,
                                    BlendMode.srcIn),
                              ),
                            );
                          },
                        )
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${products.price}",
                          style: Theme.of(context).textTheme.bodyMedium),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {},
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
