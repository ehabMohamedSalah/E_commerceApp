import 'package:e_commerce/Domain/entity/cart_entity_response/CartResponseEntity.dart';

import 'CartModel.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 2
/// data : {"_id":"667a2db1ed0dc0016c3591ab","cartOwner":"6407cf6f515bdcf347c09f17","products":[{"count":1,"_id":"667fda1ded0dc0016c5ac705","product":"6428e5e6dc1175abc65ca084","price":499},{"count":1,"_id":"667fe2b9ed0dc0016c5accf5","product":"6428ebc6dc1175abc65ca0b9","price":170}],"createdAt":"2024-06-25T02:38:41.410Z","updatedAt":"2024-06-29T10:32:25.660Z","__v":17,"totalCartPrice":669}

class CartResponseModel {
  CartResponseModel({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});

  CartResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartModel.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  int? numOfCartItems;
  CartModel? data;
CartResponseModel copyWith({  String? status,
  String? message,
  int? numOfCartItems,
  CartModel? data,
}) => CartResponseModel(  status: status ?? this.status,
  message: message ?? this.message,
  numOfCartItems: numOfCartItems ?? this.numOfCartItems,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
  CartResponseEntity toCartResponseEntity(){
    return CartResponseEntity(
      data:data?.toCartEntity() ,
      message: message,
      numOfCartItems: numOfCartItems,
    );
  }

}