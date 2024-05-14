import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/datasource_contract/product_datasource.dart';
import 'package:e_commerce/data_layer/model/ProductResponse/ProductResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ProductDataSource )
class ProductDataSourceImpl extends ProductDataSource{
  ApiManager apimanager;
  @factoryMethod
  ProductDataSourceImpl(this.apimanager);
  @override
  Future<Either<ProductResponse, String>> Getproduct( {String? sort}) async{
   try{
     var response=await apimanager.getRequest(Endpoint: Endpoints.Product,queryParameters: {"sort":ProductsSorting.MostSelling.sort});

     return left(ProductResponse.fromJson(response.data));
   }catch(error){
     return right(error.toString());
   }

  }

}
enum ProductsSorting{

  MostSelling("-sold"),
  LeastSelling("sold"),
  DescendingPrice("-price"),
  AscendingPrice("price");
  final String sort;
  const ProductsSorting(this.sort);

}
