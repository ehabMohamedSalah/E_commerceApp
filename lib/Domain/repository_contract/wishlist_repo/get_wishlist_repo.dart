import 'package:dartz/dartz.dart';

import '../../entity/wishlist/get_wishlist_entity/GetWishListEntity.dart';
import '../../entity/wishlist/get_wishlist_entity/ProductEntityWish.dart';

abstract class GetWishListRepo{
  Future<Either<List<ProductEntityResponse>,String>>GetWishList();
}