import 'package:dartz/dartz.dart';
 import 'package:e_commerce/Domain/repository_contract/wishlist_repo/add_wishlist_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../Domain/entity/wishlist/add_wish_entity/add_Wishlist_entity.dart';
import '../../datasource_contract/wishlist_datasource/add_wishlist_datasource.dart';
@Injectable(as: AddWishListRepo)
class AddWishListRepoImpl extends AddWishListRepo{
  AddWishlistDatasource apidatasource;
  @factoryMethod
  AddWishListRepoImpl(this.apidatasource);

  @override
  Future<Either<WishlistEntity, String>> AddWishListProduct(String productId) async{
    var result=await apidatasource.AddWishListProduct(productId);
   return result.fold(
            (response) {
              return left(response.towishEntity());
            } ,
            (error) {
              return right(error);
               } );
  }

}