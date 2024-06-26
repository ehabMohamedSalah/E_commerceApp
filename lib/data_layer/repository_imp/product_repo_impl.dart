import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/ProductEntity/ProductEntity.dart';
import 'package:e_commerce/Domain/repository_contract/Product_repo.dart';
import 'package:e_commerce/data_layer/datasource_contract/product_datasource.dart';
import 'package:e_commerce/data_layer/model/ProductResponse/ProductModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ProductRepo )
class ProductRepoImpl extends ProductRepo{
  ProductDataSource ApiDataSource;
  @factoryMethod
  ProductRepoImpl(this.ApiDataSource);
  @override
  Future<Either<List<ProductEntity>, String>> GetProduct({String? sort}) async{
    var response =await ApiDataSource.Getproduct(sort: sort);
    return response.fold(
            (response) {
              List<ProductModel>  productListModel=response.data??[];
              List<ProductEntity> products=  productListModel.map((product) =>product.toProductEntity() ).toList();
               return left(products );
             },
            (error) {
               return right(error.toString());
            });
  }

}