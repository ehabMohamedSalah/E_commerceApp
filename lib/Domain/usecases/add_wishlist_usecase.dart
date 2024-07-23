

import 'package:dartz/dartz.dart';
 import 'package:e_commerce/Domain/repository_contract/wishlist_repo/add_wishlist_repo.dart';
import 'package:injectable/injectable.dart';

import '../entity/wishlist/add_wish_entity/add_Wishlist_entity.dart';

@injectable
class AddWishListUsecase{
  AddWishListRepo addWishListRepo;
  @factoryMethod
  AddWishListUsecase(this.addWishListRepo);
  Future<Either<WishlistEntity,String>>call(String ProductId){
    return addWishListRepo.AddWishListProduct(ProductId);
  }
}