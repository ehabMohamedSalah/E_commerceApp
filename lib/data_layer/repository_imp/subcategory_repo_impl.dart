import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/ProductEntity/SubcategoryEntity.dart';
import 'package:e_commerce/Domain/repository_contract/subcategory_repo.dart';
import 'package:e_commerce/data_layer/datasource_contract/subCategory_datasource.dart';
import 'package:injectable/injectable.dart';

import '../model/ProductResponse/Subcategory.dart';

@Injectable(as:SubcategoryRepo )
class SubcategoryRepoImpl extends SubcategoryRepo{
  SubcategoryDataSource ApiDataSource;
  SubcategoryRepoImpl(this.ApiDataSource);
  @override
  Future<Either<List<SubcategoryEntity>, String>> GetSubcategory( String CategoryId)async {
  var response= await  ApiDataSource.GetSubCategory( CategoryId);
  return response.fold(
          (response) {
            List<Subcategory> ListSubcategoryModel=  response.data??[];
            List<SubcategoryEntity> ListSubcategoryEntity=ListSubcategoryModel.map((subcategoryModel) => subcategoryModel.toSubcategoryEntity()).toList();
            return left(ListSubcategoryEntity);
          },
          (error) => right(error.toString()));
  }
}