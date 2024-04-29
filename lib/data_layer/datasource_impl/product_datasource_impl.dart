import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/datasource_contract/product_datasource.dart';
import 'package:e_commerce/data_layer/model/ProductResponse/ProductResponse.dart';

class ProductDataSourceImpl extends ProductDataSource{
  ApiManager apimanager;
  ProductDataSourceImpl(this.apimanager);
  @override
  Future<Either<ProductResponse, String>> Getproduct( {String? sort}) async{
   try{
     var response=await apimanager.getRequest(Endpoint: Endpoints.Product);
     ProductResponse productResponse= ProductResponse.fromJson(response.data);
     return left(response.data);
   }catch(error){
     return right(error.toString());
   }

  }

}
enum ProductsSorting{

  MostSelling("_sold"),
  LeastSelling("sold"),
  DescendingPrice("-price"),
  AscendingPrice("price");
  final String sort;
  const ProductsSorting(this.sort);

}
