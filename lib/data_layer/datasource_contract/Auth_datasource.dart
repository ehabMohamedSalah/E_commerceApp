import 'package:dartz/dartz.dart';
import 'package:e_commerce/data_layer/model/Auth_response/AuthResponse.dart';

abstract class AuthDataSource{

 Future<Either<AuthResponseModel,String>>  SignUp({
    required String name,
    required String email,
    required String password,
    required String mobile,
});
}