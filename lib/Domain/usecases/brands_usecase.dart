
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository_contract/Brand_repo.dart';
import 'package:injectable/injectable.dart';

import '../entity/BrandEntity.dart';

@injectable
class BrandUseCase{
  Brandrepo brandrepo;
  @factoryMethod
  BrandUseCase(this.brandrepo);
  Future<Either<List<BrandEntity>, String>> call(){
   return brandrepo.GetBrand();
  }
}