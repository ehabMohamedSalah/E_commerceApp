

import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/wishlist/get_wishlist_entity/GetWishListEntity.dart';
import 'package:e_commerce/Domain/repository_contract/wishlist_repo/get_wishlist_repo.dart';
import 'package:e_commerce/data_layer/datasource_contract/wishlist_datasource/get_wishlist_datasource.dart';
import 'package:e_commerce/data_layer/model/wishilist_response/get_wishlist/ProductModelWish.dart';
import 'package:injectable/injectable.dart';

import '../../../Domain/entity/wishlist/get_wishlist_entity/ProductEntityWish.dart';
import '../../model/wishilist_response/get_wishlist/GetWishListResponse.dart';

@Injectable(as:GetWishListRepo )
class GetWishlistRepoImpl extends GetWishListRepo{
  GetWishlistDatasource getWishlistDatasource;
  @factoryMethod
  GetWishlistRepoImpl(this.getWishlistDatasource);

  @override
  Future<Either<List<ProductEntityResponse>, String>> GetWishList() async{
    var result=await getWishlistDatasource.GetWishListProduct();
    return result.fold(
            (response) {
              List<ProductModelWishList>? productModel=response.data;
              List<ProductEntityResponse> listProduct=productModel?.map((product) =>product.toProductEntityResponse() ).toList()??[];
              return left(listProduct);
            },
            (error) => right(error)
    );
  }
}