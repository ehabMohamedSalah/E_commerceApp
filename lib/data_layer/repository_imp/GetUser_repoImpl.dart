
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/user_entity/user_entity.dart';
import 'package:e_commerce/Domain/repository_contract/GetUser_Repo.dart';
import 'package:e_commerce/data_layer/datasource_contract/get_user_dataSource.dart';
import 'package:e_commerce/data_layer/model/user_model/UserModelResponse.dart';

import 'package:injectable/injectable.dart';


@Injectable(as: GetUserRepo)
class GetUserDataRepoImpl extends GetUserRepo{
  GetUserDataSource getUserDataDatasourceContract ;
  @factoryMethod
  GetUserDataRepoImpl(this.getUserDataDatasourceContract);
  @override


  @override
  Future<Either<UserDataEntity, String>> GetUser({required UserId})async {
    var result = await getUserDataDatasourceContract.GetUser(UserId: UserId) ;
    return result.fold(
            (response) {
          var userResponse = UserDataEntity(
            email: response.data?.email,
            name: response.data?.name,
            id: response.data?.id,
            phone: response.data?.phone,
          );
          return Left(userResponse);
        },
            (error) => Right(error)
    );
  }

}
