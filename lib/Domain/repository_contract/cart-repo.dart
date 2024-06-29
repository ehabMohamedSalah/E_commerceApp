import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/cart_entity_response/CartResponseEntity.dart';

abstract class CartRepo{

  Future<Either<CartResponseEntity,String>> AddToCart({required String productId});
}