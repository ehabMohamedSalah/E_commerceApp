import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/entity/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../Domain/usecases/get_user_usecase.dart';

part 'profile_view_model_state.dart';
@injectable
class ProfileViewModel extends Cubit<ProfileViewModelState> {
  GetUserUsecase getUserUsecase;
  @factoryMethod
  ProfileViewModel(this.getUserUsecase) : super(ProfileViewModelInitial());

  getuserData({required String userId})async{
    emit(ProfileViewModelLoading());
    var response =await getUserUsecase.call(userId: userId);
     return response.fold(
             (userData) => emit(ProfileViewModelSuccess(userData)),
             (error) => emit(ProfileViewModelError(error)));
  }
}
