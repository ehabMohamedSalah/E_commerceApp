import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository_contract/Product_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data_layer/datasource_impl/product_datasource_impl.dart';
import '../entity/ProductEntity/ProductEntity.dart';
@injectable
class MostSellingProductUseCase{
  ProductRepo productRepo;
  @factoryMethod
  MostSellingProductUseCase(this.productRepo);

  Future<Either<List<ProductEntity>, String>> call(){
    return productRepo.GetProduct(sort: ProductsSorting.MostSelling.sort);
  }
}