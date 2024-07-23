import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository_contract/wishlist_repo/get_wishlist_repo.dart';
import 'package:injectable/injectable.dart';

import '../entity/wishlist/get_wishlist_entity/ProductEntityWish.dart';

@injectable
class GetWishListUseCase{

  GetWishListRepo getWishListRepo;
  @factoryMethod
  GetWishListUseCase(this.getWishListRepo);

  Future<Either<List<ProductEntityResponse>, String>> call(){
    return getWishListRepo.GetWishList();
  }
}