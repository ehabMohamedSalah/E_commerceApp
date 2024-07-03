import 'package:bloc/bloc.dart';
import 'package:e_commerce/data_layer/model/GetCartResponse/GetCartResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../Domain/usecases/get_card.dart';

part 'cart_view_model_state.dart';

@injectable
class CartViewModel extends Cubit<CartViewModelState> {
  GetCardUsecase getCardUsecase;
  @factoryMethod
  CartViewModel(this.getCardUsecase) : super(CartViewModelInitial());

  GetCard()async{
    emit(CartLoadingState());
    var result=await getCardUsecase.call();
    result.fold(
            (response) => emit(CartSuccessStatee(response)),
            (error) => emit(CartErrorState(error)));
  }
}
