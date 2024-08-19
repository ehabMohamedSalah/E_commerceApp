import 'package:dartz/dartz.dart';

import '../../data_layer/model/delete_cart_response/DeleteCartResponse.dart';


abstract class DeleteCartItemRepo{
  Future<Either<DeleteCartResponse,String>>DeleteCart({required String ProductId});
}