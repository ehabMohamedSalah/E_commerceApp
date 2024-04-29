import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/ProductEntity/ProductEntity.dart';

abstract class ProductRepo{

  Future<Either<List<ProductEntity>,String>> GetProduct({String? sort});
}