
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/repository_contract/del_cart_item_repo.dart';
import '../datasource_contract/del_cart_itemDatasource.dart';
import '../model/delete_cart_response/DeleteCartResponse.dart';

@Injectable(as:DeleteCartItemRepo )
class DelCartItemRepoImpl extends DeleteCartItemRepo{
  DeleteCartItemDatasource apiDatasource;
  @factoryMethod
  DelCartItemRepoImpl(this.apiDatasource);

  Future<Either<DeleteCartResponse, String>>  DeleteCart({required String ProductId})async{
    var response=await apiDatasource.DeleteCart(ProductId: ProductId);
    return response.fold(
            (response) {
               return left(response);
            },
            (error) => right(error));
  }

}