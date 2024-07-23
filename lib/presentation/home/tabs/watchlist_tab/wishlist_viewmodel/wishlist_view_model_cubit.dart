import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../Domain/entity/wishlist/get_wishlist_entity/ProductEntityWish.dart';
import '../../../../../Domain/usecases/get_wishlist_usecase.dart';

part 'wishlist_view_model_state.dart';

@injectable
class WishlistViewModel extends Cubit<WishlistViewModelState> {
  GetWishListUseCase getWishListUseCase;
  @factoryMethod
  WishlistViewModel(this.getWishListUseCase) : super(WishlistViewModelInitial());
  static WishlistViewModel get(context) {
    return BlocProvider.of(context);
  }
  bool isclick=false;
  isClicked(bool newClick){
    isclick=newClick;
    emit(WishlistViewModelClicked());
  }

  GetWishList()async{
    emit(WishlistViewModelLoading());
    var result=await getWishListUseCase.call();
    result.fold(
            (products) => emit(WishlistViewModelSuccess(products)),
            (error) => emit(WishlistViewModelError(error)));
  }
}
