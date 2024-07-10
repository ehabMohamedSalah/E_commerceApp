import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository_contract/GetUser_Repo.dart';
import 'package:injectable/injectable.dart';

import '../entity/user_entity/user_entity.dart';
@injectable
class GetUserUsecase{
  GetUserRepo getUserRepo;
  @factoryMethod
  GetUserUsecase(this.getUserRepo);
  Future<Either<UserDataEntity,String>> call({required userId}){
    return getUserRepo.GetUser(UserId: userId);
  }

}