
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository_contract/subcategory_repo.dart';
import 'package:injectable/injectable.dart';
import '../entity/ProductEntity/SubcategoryEntity.dart';

@injectable
class SubcategoryUsecase{
  SubcategoryRepo subcategoryRepo;
  @factoryMethod
  SubcategoryUsecase(this.subcategoryRepo);
  Future<Either<List<SubcategoryEntity>, String>> call(String CategoryId){
     return  subcategoryRepo.GetSubcategory( CategoryId);
  }
}