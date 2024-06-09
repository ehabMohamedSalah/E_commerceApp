import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../Domain/usecases/Auth_usecase/Signup_usecase.dart';

part 'sign_up_view_model_state.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  @factoryMethod
  SignUpViewModel(this.signUpUsecase) : super(SignUpInitial());
  SignUpUsecase signUpUsecase;
  static SignUpViewModel get(BuildContext context){
    return BlocProvider.of(context);
  }

  SignUp({required String name,required String email,required String password,required String mobile})async{
    emit(SignUpLoadingState());
    var response=await signUpUsecase.call(name: name, email: email, password: password, mobile: mobile);
    response.fold((result) {
   emit(SignUpSuccessState(result.token??""));
    }, (error) {
emit(SignUpErrorState(error));
            });
  }
}
