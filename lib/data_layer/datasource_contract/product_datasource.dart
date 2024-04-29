import 'package:dartz/dartz.dart';
import 'package:e_commerce/data_layer/model/ProductResponse/ProductResponse.dart';

abstract class ProductDataSource{
   Future<Either<ProductResponse,String>> Getproduct({String? sort});
}