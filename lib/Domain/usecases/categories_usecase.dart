import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository_contract/categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../entity/Categories_entity.dart';

@injectable
class CategoriesUseCase{
  @factoryMethod
  //hy3tmd al CategoryRepo ale tgeblo al data
  CategoryRepo categoriesRepo;
  CategoriesUseCase(this.categoriesRepo);

  //kol ale ht3mlo enha t3ml call le al func
  Future<Either<List<CategoryEntity>, String>> call(){
    return  categoriesRepo.getCategories();

  }
}