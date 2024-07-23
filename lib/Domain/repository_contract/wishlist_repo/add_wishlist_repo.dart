import 'package:dartz/dartz.dart';

import '../../entity/wishlist/add_wish_entity/add_Wishlist_entity.dart';


abstract class AddWishListRepo{
  Future<Either<WishlistEntity,String>> AddWishListProduct(String productId);
}