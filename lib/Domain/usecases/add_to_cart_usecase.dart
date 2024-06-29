import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/cart_entity_response/CartResponseEntity.dart';
import 'package:e_commerce/Domain/repository_contract/cart-repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddToCartUsecase{
  CartRepo cartRepo;
  @factoryMethod
  AddToCartUsecase(this.cartRepo);
 Future<Either<CartResponseEntity,String>> call({required String ProductId}){
   return cartRepo.AddToCart(productId: ProductId);
  }

}