import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../Domain/usecases/Auth_usecase/SignIn_usecase.dart';

part 'sign_in_view_model_state.dart';
@injectable
class SignInViewModel extends Cubit<SignInViewModelState> {
  SignInUsecase signInUsecase;
  @factoryMethod
  SignInViewModel(this.signInUsecase) : super(SignInViewModelInitial());
  static SignInViewModel get(context){
    return BlocProvider.of(context);
  }
}
