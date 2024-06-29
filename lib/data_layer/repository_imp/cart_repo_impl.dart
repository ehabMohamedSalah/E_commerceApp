import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/cart_entity_response/CartResponseEntity.dart';
import 'package:e_commerce/Domain/repository_contract/cart-repo.dart';
import 'package:e_commerce/data_layer/datasource_contract/cart_datasource.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo{
  CartDatasource apiDataSource;
  @factoryMethod
  CartRepoImpl(this.apiDataSource);
  @override
  Future<Either<CartResponseEntity, String>> AddToCart({required String productId}) async{
   var result= await apiDataSource.AddToCart(ProductId: productId);
   return result.fold(
           (response) {
               return left(response.toCartResponseEntity());
           },
           (error) => right(error),
   );
  }

}