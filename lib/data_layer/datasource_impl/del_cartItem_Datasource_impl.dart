import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/endpoint.dart';
import 'package:e_commerce/data_layer/datasource_contract/del_cart_itemDatasource.dart';
import 'package:e_commerce/data_layer/model/delete_cart_response/DeleteCartResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/shared_prefs/local/prefs_helper.dart';

@Injectable(as: DeleteCartItemDatasource)
class DeleteCartItemDataSourceImpl extends DeleteCartItemDatasource{
  ApiManager apiManager;
  @factoryMethod
  DeleteCartItemDataSourceImpl(this.apiManager);

  @override
  Future<Either<DeleteCartResponse, String>> DeleteCart({required String ProductId})async {
  try{
    var result=await apiManager.delete(Endpoint: Endpoints.deleteItemOfCart(ProductId),
        headers: {"token":PrefsHelper.getToken(),});
    return left(DeleteCartResponse.fromJson(result.data));
  }catch(error){
    return right(error.toString());
  }
  }
  
  
}