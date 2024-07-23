

import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/wishlist/deleteItem/DeleteWishListEntity.dart';
import 'package:e_commerce/data_layer/datasource_contract/wishlist_delete_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../Domain/repository_contract/wishlist_repo/delete_wishlist_repo.dart';
@Injectable(as: DeleteWishListRepo)
class WishListDeleteRepoImpl extends DeleteWishListRepo{
  WishListDeleteDataSource apiDataSource;
  @factoryMethod
  WishListDeleteRepoImpl(this.apiDataSource);
  @override
  Future<Either<DeleteWishlistEntity, String>> WishListDelete({required String ProductId}) async{
    var result=await apiDataSource.WishListDelete(ProductId: ProductId);
   return result.fold(
            (response) {
              return left(response.toDeleteWishlistEntity() );
            },
            (error) => right(error));
  }
}