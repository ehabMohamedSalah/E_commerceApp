import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/ProductEntity/SubcategoryEntity.dart';

abstract class SubcategoryRepo{

 Future<Either<List<SubcategoryEntity>,String>> GetSubcategory( String CategoryId);
}