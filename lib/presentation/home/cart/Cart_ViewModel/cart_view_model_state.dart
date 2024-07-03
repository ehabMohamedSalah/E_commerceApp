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

