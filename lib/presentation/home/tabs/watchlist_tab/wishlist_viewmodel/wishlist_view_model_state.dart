part of 'wishlist_view_model_cubit.dart';

@immutable
sealed class WishlistViewModelState {}

final class WishlistViewModelInitial extends WishlistViewModelState {}
  class WishlistViewModelLoading extends WishlistViewModelState {}
  class WishlistViewModelClicked extends WishlistViewModelState {}

class WishlistViewModelError extends WishlistViewModelState {}
class WishlistViewModelSuccess extends WishlistViewModelState {}


