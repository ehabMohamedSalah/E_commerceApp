import 'package:dartz/dartz.dart';

import '../model/wishilist_response/deleteItem/DeleteWishListResponse.dart';

abstract class WishListDeleteDataSource{

  Future<Either<DeleteWishlistResponse,String>> WishListDelete({required String ProductId});
}