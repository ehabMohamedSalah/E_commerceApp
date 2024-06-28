import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/Auth_Response/AuthEntity.dart';


abstract class AuthRepo{

  Future<Either<AuthResponseEntity,String>>  SignUp({
    required String name,
    required String email,
    required String password,
    required String mobile,
  });
  Future<Either<AuthResponseEntity,String>> SignIn({required String Email,required String password});
}