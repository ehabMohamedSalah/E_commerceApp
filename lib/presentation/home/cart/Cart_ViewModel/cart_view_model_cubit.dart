import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/entity/update_Product/UpdateProductResponseEntity.dart';
import 'package:e_commerce/data_layer/model/GetCartResponse/GetCartResponse.dart';
import 'package:e_commerce/data_layer/model/delete_cart_response/DeleteCartResponse.dart';
import 'package:e_commerce/data_layer/model/update_product/UpdateProductResponse.dart';
import 'package:e_commerce/data_layer/model/update_product/UpdateProductResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:e_commerce/data_layer/model/update_product/UpdateProductResponse.dart';
import '../../../../Domain/entity/cart_entity_response/CartResponseEntity.dart';
import '../../../../Domain/usecases/add_to_cart_usecase.dart';
import '../../../../Domain/usecases/del_cartitem_usecase.dart';
import '../../../../Domain/usecases/get_card.dart';
import '../../../../Domain/usecases/update_usecase.dart';
import '../../../../data_layer/model/update_product/UpdateProductResponse.dart';

part 'cart_view_model_state.dart';

@injectable
class CartViewModel extends Cubit<CartViewModelState> {
  static CartViewModel get(context){
    return BlocProvider.of(context);
  }
  GetCardUsecase getCardUsecase;
  AddToCartUsecase addToCartUsecase;
  UpdateProduct_usecase updateProduct_usecase;
  DeleteCartItemUseCase deleteCartItemUseCase;

  @factoryMethod
  CartViewModel(this.getCardUsecase,this.addToCartUsecase,this.updateProduct_usecase,this.deleteCartItemUseCase) : super(CartViewModelInitial());

  GetCard()async{
    emit(
        CartLoadingState());
    var result=await getCardUsecase.call();
    result.fold(
            (response) => emit(CartSuccessStatee(response)),
            (error) => emit(CartErrorState(error)));
  }
  addToCart({required String productId})async{
    emit(AddToCartLoading2(productId));
    var response=await addToCartUsecase.call(ProductId: productId);
    response.fold(
            (cartResponseEntity) {
          emit(AddToCartSuccess2(productId, cartResponseEntity));
        },

            (error) {
          emit(AddToCartError2(productId, error));
        });
  }

  UpdateProduct({required String productId})async{
    emit(UpdateProductLoading(productId));

    var response=await updateProduct_usecase.call(ProductId: productId);
    response.fold(
            (cartResponseEntity) {
          emit(UpdateProductSuccess(productId, cartResponseEntity));
        },

            (error) {
          emit(UpdateProductError(productId, error));
        });
  }

  DelCartItem({required String ProductId})async{
    emit(DeleteCartLoading(ProductId));
    var response=await deleteCartItemUseCase.call(ProductId: ProductId);
    response.fold(
            (deleteItem) => DeleteCartSuccess(ProductId, deleteItem),
            (error) => DeleteCartError(ProductId, error));
  }

}
