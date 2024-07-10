
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/model/user_model/UserModelResponse.dart';
import 'package:injectable/injectable.dart';

import '../datasource_contract/get_user_dataSource.dart';

@Injectable(as:GetUserDataSource )
class GetUserDataSourceImpl extends GetUserDataSource{
  ApiManager apiManager;
  @factoryMethod
  GetUserDataSourceImpl(this.apiManager);
  @override
  Future<Either<UserResponse, String>> GetUser({required UserId})async {
try{
  var response= await apiManager.getRequest(Endpoint: Endpoints.UserData(UserId));
  UserResponse userResponse=UserResponse.fromJson(response.data);
      return left(userResponse);
}catch(error){
  return right(error.toString());
}
   }
  
}