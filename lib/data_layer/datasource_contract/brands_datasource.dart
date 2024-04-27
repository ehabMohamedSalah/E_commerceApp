import 'package:dartz/dartz.dart';
import '../model/BrandsResponse/BrandsResponse.dart';


abstract class BrandsDataSource{

  Future<Either<BrandsResponse,String>> GetBrands();
}