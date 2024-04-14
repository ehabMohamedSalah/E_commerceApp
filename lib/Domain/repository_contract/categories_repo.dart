import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/Categories_entity.dart';

import '../../data_layer/model/categoriesResponse.dart';

abstract class CategoryRepo{

  Future<Either<List<CategoryEntity>,String>>getCategories();
}