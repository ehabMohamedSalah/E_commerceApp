import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/usecases/categories_usecase.dart';
import 'package:e_commerce/Domain/usecases/subcategory_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/entity/Categories_entity.dart';
import '../../../../../Domain/entity/ProductEntity/SubcategoryEntity.dart';
@injectable
class CategoryViewModel extends Cubit<CategoryStates>{
  @factoryMethod
  CategoryViewModel(this.categoriesUseCase,this.subcategoryUsecase):super(initialCategoryState());
  static CategoryViewModel get(BuildContext context)=>BlocProvider.of(context);
  CategoriesUseCase categoriesUseCase;
  SubcategoryUsecase subcategoryUsecase;

  getCategories()async{
    var response=await categoriesUseCase.call();
    response.fold(
            (categories) => emit(SuccessCategoryState(categories)),
            (errorMessage) => emit(ErrorCategoryState(errorMessage)),
    );
  }
  getSubCategories(String CategoryId)async{
    emit(SubcategoriesLoadingState());
    var response=await subcategoryUsecase.call(CategoryId);
    response.fold(
            (subcategories) => emit(SubcategoriesSuccessState(subcategories)),
            (error) =>   emit(SubcategoriesErrorState(error)),
    );
  }
}



abstract class CategoryStates {}
class initialCategoryState extends CategoryStates{}
class LoadingCategoryState extends CategoryStates{}
class ErrorCategoryState extends CategoryStates{
  String errorMessage;
  ErrorCategoryState(this.errorMessage);
}
class SuccessCategoryState extends CategoryStates{
  List<CategoryEntity> categories;
  SuccessCategoryState(this.categories);
}

class SubcategoriesSuccessState extends CategoryStates{
  List<SubcategoryEntity> subcategoryEntity;
  SubcategoriesSuccessState(this.subcategoryEntity);
}
class SubcategoriesErrorState extends CategoryStates{
  String ErrorMessage;
  SubcategoriesErrorState(this.ErrorMessage);
}
class SubcategoriesLoadingState extends CategoryStates{

}