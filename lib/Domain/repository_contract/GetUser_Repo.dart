import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/Auth_Response/User.dart';
import 'package:e_commerce/Domain/entity/user_entity/user_entity.dart';

abstract class GetUserRepo{

  Future<Either<UserDataEntity,String>>GetUser({required String UserId});
}
