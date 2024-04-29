

import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/usecases/brands_usecase.dart';
import 'package:e_commerce/Domain/usecases/categories_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/entity/BrandEntity.dart';
import '../../../../../Domain/entity/Categories_entity.dart';
 @injectable
class HomeTabViewModel extends Cubit<HomeTabState>{

  //ana 3ayzo yst5dm al useCase
  @factoryMethod
  HomeTabViewModel(this.categoriesUseCase,this.brandUseCase):super(NewTabInitialState());

  CategoriesUseCase categoriesUseCase;
  BrandUseCase brandUseCase;

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