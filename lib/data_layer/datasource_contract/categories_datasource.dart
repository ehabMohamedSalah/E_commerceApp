

import 'package:dartz/dartz.dart';

import '../model/categoryResponse/categoriesResponse.dart';

abstract class categoriesDataSource{

  Future<Either<CategoriesResponse,String>>getCategories();
}