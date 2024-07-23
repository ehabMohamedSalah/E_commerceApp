import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/model/wishilist_response/get_wishlist/GetWishListResponse.dart';
import 'package:injectable/injectable.dart';
import '../../../core/shared_prefs/local/prefs_helper.dart';
import '../../datasource_contract/wishlist_datasource/get_wishlist_datasource.dart';

@Injectable(as: GetWishlistDatasource)
class GetWishListDatasourceImpl extends GetWishlistDatasource{
  ApiManager apiManager;
  @factoryMethod
  GetWishListDatasourceImpl(this.apiManager);

  @override
  Future<Either<GetWishListResponse, String>> GetWishListProduct() async{
try{
  var result=await apiManager.getRequest(Endpoint: Endpoints.Addwishlist, headers: {
    "token":PrefsHelper.getToken(),
  },);
    return left(GetWishListResponse.fromJson(result.data));
} catch(error){
  return right(error.toString());
}
  }

}