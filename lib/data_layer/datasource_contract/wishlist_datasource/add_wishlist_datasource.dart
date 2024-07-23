

import 'package:dartz/dartz.dart';

import '../../model/wishilist_response/add_Wishilist_response.dart';

abstract class AddWishlistDatasource{

  Future<Either<WishilistResponse,String>> AddWishListProduct(String ProductId);
}