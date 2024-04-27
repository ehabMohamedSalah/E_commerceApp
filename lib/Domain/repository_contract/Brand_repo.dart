
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/BrandEntity.dart';

abstract class Brandrepo{
  Future<Either<List<BrandEntity>,String>> GetBrand();
}