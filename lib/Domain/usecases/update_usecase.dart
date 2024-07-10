import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/cart_entity_response/CartResponseEntity.dart';
import 'package:e_commerce/Domain/repository_contract/cart-repo.dart';
import 'package:e_commerce/data_layer/model/GetCartResponse/GetCartResponse.dart';
import 'package:e_commerce/data_layer/model/update_product/UpdateProductResponse.dart';
import 'package:injectable/injectable.dart';
@injectable
class UpdateProduct_usecase{
  CartRepo cartRepo;
  @factoryMethod
  UpdateProduct_usecase(this.cartRepo);
  Future<Either<UpdateProductResponse, String>> call({required String ProductId}){
    return cartRepo.UpdateProduct(ProductId: ProductId);
  }

}