import 'package:dartz/dartz.dart';

import '../../entity/wishlist/deleteItem/DeleteWishListEntity.dart';


abstract class DeleteWishListRepo{

  Future<Either<DeleteWishlistEntity,String>> WishListDelete({required String ProductId});
}