import 'package:dartz/dartz.dart';
import 'package:e_commerce/data_layer/model/GetCartResponse/GetCartResponse.dart';
import 'package:e_commerce/data_layer/model/cart_response/CartResponseModel.dart';

abstract class CartDatasource{

  Future<Either<CartResponseModel,String>> AddToCart({required String ProductId});
  Future<Either<GetCartResponse,String>> GetCart();

}