

import 'package:dartz/dartz.dart';

import '../model/categoriesResponse.dart';

abstract class categoriesDataSource{

  Future<Either<CategoriesResponse,String>>getCategories();
}