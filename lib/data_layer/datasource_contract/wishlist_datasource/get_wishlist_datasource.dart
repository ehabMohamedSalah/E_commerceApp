import 'package:dartz/dartz.dart';
import 'package:e_commerce/data_layer/model/wishilist_response/get_wishlist/GetWishListResponse.dart';

abstract class GetWishlistDatasource{

  Future<Either<GetWishListResponse,String>> GetWishListProduct();
}