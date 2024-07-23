part of 'wishlist_view_model_cubit.dart';

@immutable
sealed class WishlistViewModelState {}

final class WishlistViewModelInitial extends WishlistViewModelState {}
class WishlistViewModelClicked extends WishlistViewModelState {}

  class WishlistViewModelLoading extends WishlistViewModelState {}
class WishlistViewModelError extends WishlistViewModelState {
  String errorMessage;
  WishlistViewModelError(this.errorMessage);
}
class WishlistViewModelSuccess extends WishlistViewModelState {
  List<ProductEntityResponse> products;
  WishlistViewModelSuccess(this.products);
}


