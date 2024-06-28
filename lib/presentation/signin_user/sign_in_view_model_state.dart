part of 'sign_in_view_model_cubit.dart';

@immutable
sealed class SignInViewModelState {}

final class SignInViewModelInitial extends SignInViewModelState {}
class SignInloading extends SignInViewModelState{}
class SignInErorr extends SignInViewModelState{
  String ErrorMessage;
  SignInErorr(this.ErrorMessage);
}
class SignInSuccess extends SignInViewModelState{
  AuthResponseEntity AuthEntity;
  SignInSuccess(this.AuthEntity);
}
