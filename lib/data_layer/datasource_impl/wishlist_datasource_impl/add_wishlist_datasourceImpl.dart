import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/model/wishilist_response/add_Wishilist_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/shared_prefs/local/prefs_helper.dart';
import '../../datasource_contract/wishlist_datasource/add_wishlist_datasource.dart';
@Injectable(as: AddWishlistDatasource)
class WishlistDatasourceImpl extends AddWishlistDatasource{
  ApiManager apiManager;
  @factoryMethod
  WishlistDatasourceImpl(this.apiManager);
  @override
  Future<Either<WishilistResponse, String>> AddWishListProduct(String ProductId)async {
 try{
   var response= await apiManager.postRequest(endpoint: Endpoints.Addwishlist,
       headers: {
         "token":PrefsHelper.getToken(),
       }, body: {
         "productId": ProductId,
       });
   return left(WishilistResponse.fromJson(response.data));
 }
 catch(error){
   return right(error.toString());
 }
  }

}