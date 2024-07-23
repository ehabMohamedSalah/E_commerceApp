import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/data_layer/datasource_contract/subCategory_datasource.dart';
import 'package:e_commerce/data_layer/model/subCategoryModel/SubcategoryResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/endpoint.dart';

@Injectable(as:SubcategoryDataSource )
class SubcategoryDatasourceImpl extends SubcategoryDataSource{
  ApiManager apimanager;
  SubcategoryDatasourceImpl({required this.apimanager});
  @override
  Future<Either<SubcategoryResponse, String>> GetSubCategory( String CategoryId) async {
  try{
     var response=await apimanager.getRequest(Endpoint: Endpoints.SubCategoriesEndpoint(CategoryId) );
     SubcategoryResponse subcategoryResponse= SubcategoryResponse.fromJson(response.data);
     return  left(subcategoryResponse);
  }catch(error){
     return right(error.toString() );
   }
  }

}