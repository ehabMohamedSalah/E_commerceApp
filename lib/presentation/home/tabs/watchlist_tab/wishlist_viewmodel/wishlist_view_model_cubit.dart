import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../Domain/entity/wishlist/deleteItem/DeleteWishListEntity.dart';
import '../../../../../Domain/entity/wishlist/get_wishlist_entity/ProductEntityWish.dart';
import '../../../../../Domain/usecases/delete_wishlist_usecase.dart';
import '../../../../../Domain/usecases/get_wishlist_usecase.dart';

part 'wishlist_view_model_state.dart';

@injectable
class WishlistViewModel extends Cubit<WishlistViewModelState> {
  GetWishListUseCase getWishListUseCase;
    DeleteWishListUsecase deleteWishListUsecase;

  @factoryMethod
  WishlistViewModel(this.getWishListUseCase,this.deleteWishListUsecase) : super(WishlistViewModelInitial());
  static WishlistViewModel get(context) {
    return BlocProvider.of(context);
  }




  GetWishList()async{
    emit(WishlistViewModelLoading());
    var result=await getWishListUseCase.call();
    result.fold(
            (products) => emit(WishlistViewModelSuccess(products)),
            (error) => emit(WishlistViewModelError(error)));
  }

  DeleteWishList({required String ProductId})async{
    emit(DeleteWishlistViewModelLoading(ProductId));
    var result=await deleteWishListUsecase.call(ProductId: ProductId);
    result.fold(
            (deleteProducts) => emit(DeleteWishlistViewModelSuccess(deleteProducts,ProductId)),
            (error) => emit(DeleteWishlistViewModelError(error,ProductId)));
  }

}
