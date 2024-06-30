

import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce/Domain/usecases/brands_usecase.dart';
import 'package:e_commerce/Domain/usecases/categories_usecase.dart';
import 'package:e_commerce/Domain/usecases/product_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/entity/BrandEntity.dart';
import '../../../../../Domain/entity/Categories_entity.dart';
import '../../../../../Domain/entity/ProductEntity/ProductEntity.dart';
import '../../../../../Domain/entity/cart_entity_response/CartResponseEntity.dart';
 @injectable
class HomeTabViewModel extends Cubit<HomeTabState>{

  //ana 3ayzo yst5dm al useCase
  @factoryMethod
  HomeTabViewModel(this.categoriesUseCase,this.brandUseCase,this.productUseCase,this.addToCartUsecase):super(NewTabInitialState());

  CategoriesUseCase categoriesUseCase;
  BrandUseCase brandUseCase;
  MostSellingProductUseCase productUseCase;
  AddToCartUsecase addToCartUsecase;

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
    var result=await brandUseCase.call();
    result.fold(
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
    var response=await addToCartUsecase.call(ProductId: productId);
    emit(AddToCartLoading(productId));
    response.fold(
            (addtocart) {
               emit(AddToCartSuccess(productId, addtocart));
            },

            (error) {
               emit(AddToCartError(productId, error));
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
