
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/model/wishilist_response/deleteItem/DeleteWishListResponse.dart';
import 'package:injectable/injectable.dart';
import '../../../core/shared_prefs/local/prefs_helper.dart';
import '../../datasource_contract/wishlist_delete_datasource.dart';
@Injectable(as: WishListDeleteDataSource)
class WishListDeleteDataSourceImpl extends WishListDeleteDataSource{
  @factoryMethod
  ApiManager apiManager;
  WishListDeleteDataSourceImpl(this.apiManager);
  @override
  Future<Either<DeleteWishlistResponse, String>> WishListDelete({required String ProductId}) async {
   try{
     var result= await apiManager.getRequest(Endpoint: Endpoints.deleteItemOfWishlisr(ProductId),headers: {
       "token":PrefsHelper.getToken(),});
      return left(DeleteWishlistResponse.fromJson(result.data));
   }catch(error){
     return right(error.toString());
   }
  }

}