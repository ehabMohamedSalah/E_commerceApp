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

class DeleteWishlistViewModelLoading extends WishlistViewModelState {
  String productId;
DeleteWishlistViewModelLoading(this.productId);
}
class DeleteWishlistViewModelError extends WishlistViewModelState {
  String errorMessage;
  String productId;
  DeleteWishlistViewModelError(this.errorMessage,this.productId);
}
class DeleteWishlistViewModelSuccess extends WishlistViewModelState {
  DeleteWishlistEntity deleteProduct;
  String productId;
  DeleteWishlistViewModelSuccess(this.deleteProduct,this.productId);
}


