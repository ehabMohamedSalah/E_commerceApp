import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/cart_entity_response/CartResponseEntity.dart';
import 'package:e_commerce/data_layer/model/GetCartResponse/GetCartResponse.dart';

import '../../data_layer/model/update_product/UpdateProductResponse.dart';

abstract class CartRepo{

  Future<Either<CartResponseEntity,String>> AddToCart({required String productId});
  Future<Either<GetCartResponse,String>> GetCart();
  Future<Either<UpdateProductResponse,String>> UpdateProduct({required String ProductId});


}