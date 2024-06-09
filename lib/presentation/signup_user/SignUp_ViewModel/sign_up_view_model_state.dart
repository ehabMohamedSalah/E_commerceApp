part of 'sign_up_view_model_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
class SignUpLoadingState extends SignUpState{}
class SignUpErrorState extends SignUpState{
  String errorMsg;
  SignUpErrorState(this.errorMsg);
}
class SignUpSuccessState extends SignUpState{
  String token;
  SignUpSuccessState(this.token);
}

