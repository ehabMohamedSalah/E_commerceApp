

import 'package:dartz/dartz.dart';
import 'package:e_commerce/data_layer/model/categoryResponse/categoriesResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_manager.dart';
import '../../core/api/endpoint.dart';
import '../datasource_contract/categories_datasource.dart';

@Injectable(as:categoriesDataSource )
class CategoriesDataSourceImpl extends categoriesDataSource{
  @override
  ApiManager apiManager;
  @factoryMethod
  CategoriesDataSourceImpl(this.apiManager);

 Future<Either<CategoriesResponse,String>>getCategories() async{
    try{
      var response=await apiManager.getRequest(Endpoint:  Endpoints.CatgoriesEndpoint);
      CategoriesResponse categoriesResponse= CategoriesResponse.fromJson(response.data);
      return left(categoriesResponse);
    }catch(error){
      //kda hyrg3 haga mn al hagten
          return right(error.toString());
    }


  }


}