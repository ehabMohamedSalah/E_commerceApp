import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entity/BrandEntity.dart';
import 'package:e_commerce/data_layer/datasource_contract/brands_datasource.dart';
import 'package:injectable/injectable.dart';
import '../../Domain/repository_contract/Brand_repo.dart';

@Injectable(as:Brandrepo )
class BrandRepoImpl extends Brandrepo{
  BrandsDataSource apiDataSource;
  @factoryMethod
  BrandRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<BrandEntity>, String>> GetBrand()async {
    var result=await apiDataSource.GetBrands();
    return result.fold(
            (brandResponse) {
              var BrandListModel=brandResponse.data??[];
              var Brands= BrandListModel.map((brands) => brands.toBrandEntity()).toList();
              return left(Brands);
            },

            (error) {
              return right(error);
            });
  }

}