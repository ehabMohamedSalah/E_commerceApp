part of 'cart_view_model_cubit.dart';

@immutable
sealed class CartViewModelState {}

final class CartViewModelInitial extends CartViewModelState {}
 class CartLoadingState extends CartViewModelState{}
class CartErrorState extends CartViewModelState{
String errorMessage;
CartErrorState(this.errorMessage);
}
class CartSuccessStatee extends CartViewModelState{
GetCartResponse cart;
CartSuccessStatee(this.cart);
}


class AddToCartLoading2 extends CartViewModelState{
 String ProductId;
 AddToCartLoading2(this.ProductId);
}
class AddToCartError2 extends CartViewModelState{
 String ProductId;
 String ErrorMessage;
 AddToCartError2(this.ProductId,this.ErrorMessage);
}
class AddToCartSuccess2 extends CartViewModelState{
 String ProductId;
 CartResponseEntity cartResponseEntity;
 AddToCartSuccess2(this.ProductId,this.cartResponseEntity);
}


class UpdateProductLoading extends CartViewModelState{
 String ProductId;
 UpdateProductLoading(this.ProductId);
}
class UpdateProductError extends CartViewModelState{
 String ProductId;
 String ErrorMessage;
 UpdateProductError(this.ProductId,this.ErrorMessage);
}
class UpdateProductSuccess extends CartViewModelState{
 String ProductId;
 UpdateProductResponse updateProductResponse;
 UpdateProductSuccess(this.ProductId,this.updateProductResponse);
}
