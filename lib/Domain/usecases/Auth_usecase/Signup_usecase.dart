import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/Auth_Response/AuthEntity.dart';
import 'package:e_commerce/Domain/repository_contract/Auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUsecase{
  @factoryMethod
  AuthRepo authRepo;
  SignUpUsecase(this.authRepo);

  Future<Either<AuthResponseEntity,String>>call({required String name, required String email,required String password,required String mobile}){
   return authRepo.SignUp(name: name, email: email, password: password, mobile: mobile);
  }
}