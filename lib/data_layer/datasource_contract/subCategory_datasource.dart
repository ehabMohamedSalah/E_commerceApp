import 'package:dartz/dartz.dart';
import 'package:e_commerce/data_layer/model/subCategoryModel/SubcategoryResponse.dart';

abstract class SubcategoryDataSource{

 Future<Either<SubcategoryResponse,String>> GetSubCategory(String CategoryId);
}