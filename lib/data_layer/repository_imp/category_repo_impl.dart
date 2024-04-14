

import 'package:dartz/dartz.dart';
import 'package:e_commerce/data_layer/datasource_contract/categories_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/entity/Categories_entity.dart';
import '../../Domain/repository_contract/categories_repo.dart';

@Injectable(as:CategoryRepo )
class categoryRepoImpl extends CategoryRepo{
  @override
  @factoryMethod
  categoriesDataSource apiDataSoure;
  categoryRepoImpl(this.apiDataSoure);
  Future<Either<List<CategoryEntity>, String>> getCategories()async {
     var result=await apiDataSoure.getCategories();
     //law Rage3 left hyhandle al left w law rag3 right hyhndl al right
     return result.fold(
             (response) {
               var categoryListModel=response.data??[];
              var categories= categoryListModel.map((categories) => categories.toCategoryEntity()).toList();
             return left(categories);
             },
             (error)  {
               return Right(error);
             });
  }
}
