import 'package:e_commerce/Domain/entity/cart_entity_response/CartEntity.dart';

import 'CartItemModel.dart';

/// _id : "667a2db1ed0dc0016c3591ab"
/// cartOwner : "6407cf6f515bdcf347c09f17"
/// products : [{"count":1,"_id":"667fda1ded0dc0016c5ac705","product":"6428e5e6dc1175abc65ca084","price":499},{"count":1,"_id":"667fe2b9ed0dc0016c5accf5","product":"6428ebc6dc1175abc65ca0b9","price":170}]
/// createdAt : "2024-06-25T02:38:41.410Z"
/// updatedAt : "2024-06-29T10:32:25.660Z"
/// __v : 17
/// totalCartPrice : 669

class CartModel {
  CartModel({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  CartModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartItemModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartItemModel>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
CartModel copyWith({  String? id,
  String? cartOwner,
  List<CartItemModel>? products,
  String? createdAt,
  String? updatedAt,
  int? v,
  int? totalCartPrice,
}) => CartModel(  id: id ?? this.id,
  cartOwner: cartOwner ?? this.cartOwner,
  products: products ?? this.products,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  v: v ?? this.v,
  totalCartPrice: totalCartPrice ?? this.totalCartPrice,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }
  CartEntity toCartEntity(){
    return CartEntity(

      id: id,
      cartOwner: cartOwner,
      products: products?.map((CartItemModel) => CartItemModel.toCartItemEntity()).toList(),
      totalCartPrice: totalCartPrice,

    );
  }

}