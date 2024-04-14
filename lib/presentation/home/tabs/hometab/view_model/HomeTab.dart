

import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/usecases/categories_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/entity/Categories_entity.dart';
 @injectable
class HomeTabViewModel extends Cubit<HomeTabState>{

  //ana 3ayzo yst5dm al useCase
  @factoryMethod
  HomeTabViewModel(this.categoriesUseCase):super(NewTabInitialState());

  CategoriesUseCase categoriesUseCase;

  GetCateories()async{
    emit(HomeTabLoadingState());
   var result =await categoriesUseCase.call();
   result.fold((categories) {
      emit(HomeSuccessState(categories));
   }, (error)  {
     emit(HomeTabErrorState(error));
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