import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/data_layer/model/Auth_response/AuthResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/endpoint.dart';
import '../datasource_contract/Auth_datasource.dart';

@Injectable(as: AuthDataSource)
class AuthDatasourceImpl extends AuthDataSource{
  ApiManager apimanager;
  @factoryMethod
  AuthDatasourceImpl(this.apimanager);
  @override
  Future<Either<AuthResponseModel, String>> SignUp({required String name, required String email, required String password, required String mobile}) async{
   try{
     var response= await apimanager.postRequest(endpoint: Endpoints.signupEndpoint,body: {
       "name": name,
       "email":email,
       "password":password,
       "rePassword":password,
       "phone":mobile
     });
     AuthResponseModel Authresponse= AuthResponseModel.fromJson(response.data);
     if(Authresponse.statusMsg!=null){
       return right(Authresponse.message??"");
     }
     return left(Authresponse);

   }catch(error){
     return right(error.toString());
   }
  }

}