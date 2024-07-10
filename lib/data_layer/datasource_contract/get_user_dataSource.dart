import 'package:dartz/dartz.dart';

import '../model/user_model/UserModelResponse.dart';

abstract class GetUserDataSource{
  Future<Either<UserResponse,String>>GetUser({required UserId});
}