import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'wishlist_view_model_state.dart';

@injectable
class WishlistViewModel extends Cubit<WishlistViewModelState> {
  static WishlistViewModel get(context) {
    return BlocProvider.of(context);
  }
    bool isclick=false;

  WishlistViewModel() : super(WishlistViewModelInitial());

   isClicked(bool newClick){
    isclick=newClick;
    emit(WishlistViewModelClicked());
  }
}
