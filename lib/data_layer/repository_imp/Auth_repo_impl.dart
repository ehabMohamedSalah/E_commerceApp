import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/Auth_Response/AuthEntity.dart';
import 'package:e_commerce/Domain/repository_contract/Auth_repo.dart';
import 'package:e_commerce/data_layer/datasource_contract/Auth_datasource.dart';
import 'package:e_commerce/data_layer/model/Auth_response/AuthResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo{
  AuthDataSource apiDatasource;
  @factoryMethod
  AuthRepoImpl(this.apiDatasource);
  @override
  Future<Either<AuthResponseEntity, String>> SignUp({required String name, required String email, required String password, required String mobile})async {
    var response=await apiDatasource.SignUp(name: name, email: email, password: password, mobile: mobile);
    return response.fold((response) {
      AuthResponseEntity authEntity = response.toAuthEntity();
      return left(authEntity);
    }, (error) {
return right(error);
            });
  }

  @override
  Future<Either<AuthResponseEntity, String>> SignIn({required String Email, required String password}) async{
    var response=await apiDatasource.Signin(Email: Email, password: password);
    return response.fold((response) {
       AuthResponseEntity AuthEntity =response.toAuthEntity();
       return left(AuthEntity);
    }, (error)  {
      return right(error);
    });
  }

}