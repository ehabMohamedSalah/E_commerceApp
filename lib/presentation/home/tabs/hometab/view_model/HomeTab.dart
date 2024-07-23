

import 'package:bloc/bloc.dart';
 import 'package:e_commerce/Domain/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce/Domain/usecases/brands_usecase.dart';
import 'package:e_commerce/Domain/usecases/categories_usecase.dart';
import 'package:e_commerce/Domain/usecases/product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/entity/BrandEntity.dart';
import '../../../../../Domain/entity/Categories_entity.dart';
import '../../../../../Domain/entity/ProductEntity/ProductEntity.dart';
import '../../../../../Domain/entity/cart_entity_response/CartResponseEntity.dart';
 import '../../../../../Domain/entity/wishlist/add_wish_entity/add_Wishlist_entity.dart';
import '../../../../../Domain/usecases/add_wishlist_usecase.dart';
 @injectable
class HomeTabViewModel extends Cubit<HomeTabState>{

   static HomeTabViewModel get(context){
     return BlocProvider.of(context);
   }
  //ana 3ayzo yst5dm al useCase
  @factoryMethod
  HomeTabViewModel(this.categoriesUseCase,this.brandUseCase,this.productUseCase,this.addToCartUsecase,this.addWishListUsecase):super(NewTabInitialState());

  CategoriesUseCase categoriesUseCase;
  BrandUseCase brandUseCase;
  MostSellingProductUseCase productUseCase;
  AddToCartUsecase addToCartUsecase;
   AddWishListUsecase addWishListUsecase;

  GetCateories()async{
    emit(HomeTabLoadingState());
   var result =await categoriesUseCase.call();
   result.fold((categories) {
      emit(HomeSuccessState(categories));
   }, (error)  {
     emit(HomeTabErrorState(error));
   });
  }
  GetBrands()async{
    emit(BrandTabLoadingState());
    var response=await brandUseCase.call();
    response.fold(
            (brands) =>emit(BrandSuccessState(brands)),
            (error) => emit(BrandTabErrorState(error)),
    );
  }
  GetProduct()async {
    emit(ProductLoadingState());
    var response = await productUseCase.call();
    response.fold((products) => emit(ProductSuccessState(products)),
            (error) => emit(ProductErrorState(error)));
  }
  addToCart({required String productId})async{
    emit(AddToCartLoading(productId));

    var response=await addToCartUsecase.call(ProductId: productId);
    response.fold(
            (cartResponseEntity) {
               emit(AddToCartSuccess(productId, cartResponseEntity));
            },

            (error) {
               emit(AddToCartError(productId, error));
            });
  }
   addToWishList({required String productId})async{
     emit(AddToWishListLoading(productId));

     var response=await addWishListUsecase.call(productId);
     response.fold(
             (wishListEntity) {
           emit(AddToWishListSuccess(productId, wishListEntity));
         },

             (error) {
           emit(AddToWishListError(productId, error));
         });
   }
}


abstract class HomeTabState{}
class NewTabInitialState extends HomeTabState{}
class HomeTabLoadingState extends HomeTabState{}
class HomeSuccessState extends HomeTabState{
  List<CategoryEntity> categories;
  HomeSuccessState(this.categories);
}
class HomeTabErrorState extends HomeTabState{
  String errorMessage;
  HomeTabErrorState(this.errorMessage);
}

class BrandTabLoadingState extends HomeTabState{}
class BrandTabErrorState extends HomeTabState{
  String errorMessage;
  BrandTabErrorState(this.errorMessage);
}
class BrandSuccessState extends HomeTabState{
   List<BrandEntity> brands;
   BrandSuccessState(this.brands);
}

class ProductLoadingState extends HomeTabState{}
class ProductErrorState extends HomeTabState{
   String errorMessage;
   ProductErrorState(this.errorMessage);
}
class ProductSuccessState extends HomeTabState{
   List<ProductEntity> products;
   ProductSuccessState(this.products);
}

class AddToCartLoading extends HomeTabState{
   String ProductId;
   AddToCartLoading(this.ProductId);
}
class AddToCartError extends HomeTabState{
  String ProductId;
  String ErrorMessage;
  AddToCartError(this.ProductId,this.ErrorMessage);
}
class AddToCartSuccess extends HomeTabState{
  String ProductId;
  CartResponseEntity cartResponseEntity;
  AddToCartSuccess(this.ProductId,this.cartResponseEntity);
}

class AddToWishListLoading extends HomeTabState{
  String ProductId;
  AddToWishListLoading(this.ProductId);
}
class AddToWishListError extends HomeTabState{
  String ProductId;
  String ErrorMessage;
  AddToWishListError(this.ProductId,this.ErrorMessage);
}
class AddToWishListSuccess extends HomeTabState{
  String ProductId;
  WishlistEntity wishlistEntity;
  AddToWishListSuccess(this.ProductId,this.wishlistEntity);
}
