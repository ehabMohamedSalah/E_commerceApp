import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity/wishlist/deleteItem/DeleteWishListEntity.dart';
import '../repository_contract/wishlist_repo/delete_wishlist_repo.dart';

@injectable
class DeleteWishListUsecase{
  DeleteWishListRepo repo;
  @factoryMethod
  DeleteWishListUsecase(this.repo);

  Future<Either<DeleteWishlistEntity, String>> call({required String ProductId}) {
   return repo.WishListDelete(ProductId: ProductId);
  }

}