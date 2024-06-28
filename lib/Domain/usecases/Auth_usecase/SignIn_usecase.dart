
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/Auth_Response/AuthEntity.dart';
import 'package:e_commerce/Domain/repository_contract/Auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUsecase{
  AuthRepo authRepo;
  @factoryMethod
  SignInUsecase({required this.authRepo});
  Future<Either<AuthResponseEntity,String>> call({required String Email,required String Password}){
    return authRepo.SignIn(Email: Email, password: Password);
  }
}