import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/cart_entity_response/CartResponseEntity.dart';
import 'package:e_commerce/Domain/repository_contract/cart-repo.dart';
import 'package:e_commerce/data_layer/model/GetCartResponse/GetCartResponse.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCardUsecase{
  CartRepo cartRepo;
  @factoryMethod
  GetCardUsecase(this.cartRepo);
  Future<Either<GetCartResponse,String>> call(){
    return cartRepo.GetCart();
  }

}