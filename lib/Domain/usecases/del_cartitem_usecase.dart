
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository_contract/del_cart_item_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data_layer/model/delete_cart_response/DeleteCartResponse.dart';

@injectable
class DeleteCartItemUseCase{
  DeleteCartItemRepo deleteCartItemRepo;
  @factoryMethod
  DeleteCartItemUseCase(this.deleteCartItemRepo);
  Future<Either<DeleteCartResponse, String>> call({required String ProductId}){
    return deleteCartItemRepo.DeleteCart(ProductId: ProductId);
  }
}