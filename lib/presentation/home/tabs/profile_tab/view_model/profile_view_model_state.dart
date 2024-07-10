part of 'profile_view_model_cubit.dart';

@immutable
sealed class ProfileViewModelState {}

final class ProfileViewModelInitial extends ProfileViewModelState {}
  class ProfileViewModelLoading extends ProfileViewModelState {}
class ProfileViewModelError extends ProfileViewModelState {
  String message;
  ProfileViewModelError(this.message);
}
class ProfileViewModelSuccess extends ProfileViewModelState {
  UserDataEntity userDataEntity;
  ProfileViewModelSuccess(this.userDataEntity);
}

