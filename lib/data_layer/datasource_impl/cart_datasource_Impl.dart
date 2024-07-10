import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/datasource_contract/cart_datasource.dart';
import 'package:e_commerce/data_layer/model/cart_response/CartResponseModel.dart';
import 'package:e_commerce/data_layer/model/update_product/UpdateProductResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/shared_prefs/local/prefs_helper.dart';
import '../model/GetCartResponse/GetCartResponse.dart';

@Injectable(as:CartDatasource)
class CartDatasourceImpl extends CartDatasource{
  ApiManager apiManager;
   @factoryMethod
   CartDatasourceImpl({required this.apiManager});

  @override
  Future<Either<CartResponseModel, String>> AddToCart({required String ProductId}) async{
    try{
     var response=await apiManager.postRequest(endpoint: Endpoints.AddtoCart,body: {
        "productId":ProductId,
      },headers: {
       "token":PrefsHelper.getToken(),
     });
     return left(CartResponseModel.fromJson(response.data));
    }catch(error){
      return right(error.toString());
    }
  }

  @override
  Future<Either<GetCartResponse, String>> GetCart() async{
    try{
      var response=  await apiManager.getRequest(Endpoint: Endpoints.AddtoCart,headers: {
        "token":PrefsHelper.getToken(),
      });
      return left(GetCartResponse.fromJson(response.data));

    }catch(error){
      return right(error.toString());
    }
  }

  @override
  Future<Either<UpdateProductResponse, String>> UpdateProduct({required String ProductId}) async{
    try{
      var response=await apiManager.put(headers: {
        "token":PrefsHelper.getToken(),
      }, Endpoint: Endpoints.UpdateProduct(ProductId));
      return left(UpdateProductResponse.fromJson(response.data));
    }catch(error){
      return right(error.toString());
    }
  }

}