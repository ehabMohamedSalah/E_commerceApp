


import 'package:dartz/dartz.dart';

import '../model/delete_cart_response/DeleteCartResponse.dart';

abstract class DeleteCartItemDatasource{
   Future<Either<DeleteCartResponse,String>>DeleteCart({required String ProductId});
}