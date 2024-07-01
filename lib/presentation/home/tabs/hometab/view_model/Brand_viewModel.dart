

import 'package:bloc/bloc.dart';
 import 'package:e_commerce/Domain/usecases/brands_usecase.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../Domain/entity/BrandEntity.dart';
  @injectable
class BrandViewModel extends Cubit<BrandState>{

  static BrandViewModel get(context){
    return BlocProvider.of(context);
  }
  //ana 3ayzo yst5dm al useCase
  @factoryMethod
  BrandViewModel(this.brandUseCasee,):super(NewTabInitialState());

   BrandUseCase brandUseCasee;


   GetBrands()async{
    emit(BrandLoadingState());
    var response=await brandUseCasee.call();
    response.fold(
          (brands) =>emit(BrandSuccessStatee(brands)),
          (error) => emit(BrandErrorState(error)),
    );
  }
 }


abstract class BrandState{}
class NewTabInitialState extends BrandState{}

class BrandLoadingState extends BrandState{}
class BrandErrorState extends BrandState{
  String errorMessage;
  BrandErrorState(this.errorMessage);
}
class BrandSuccessStatee extends BrandState{
  List<BrandEntity> brands;
  BrandSuccessStatee(this.brands);
}

