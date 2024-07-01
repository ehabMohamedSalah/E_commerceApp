import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/model/BrandsResponse/BrandsResponse.dart';
import 'package:injectable/injectable.dart';
import '../datasource_contract/brands_datasource.dart';
@Injectable(as:BrandsDataSource)
class BrandsDataSourceImpl extends BrandsDataSource{
  ApiManager Apimanager;
  @factoryMethod
  BrandsDataSourceImpl(this.Apimanager);
  @override
  Future<Either<BrandsResponse, String>> GetBrands() async{
    try{
      //al response shayl hagat ktera mnha al data> al heya al json ale 3ayz a7wlo mn al json  le model BrandsResponse
      var response=await Apimanager.getRequest(Endpoint:Endpoints.BrandsEndpoint  );
      var brandsResponse= BrandsResponse.fromJson(response.data);
      return left(brandsResponse);
    }catch(error){
      return right(error.toString());
    }

  }

}