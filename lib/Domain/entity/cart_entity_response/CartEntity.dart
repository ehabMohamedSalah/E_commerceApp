import 'CartItemEntity.dart';

/// _id : "667a2db1ed0dc0016c3591ab"
/// cartOwner : "6407cf6f515bdcf347c09f17"
/// products : [{"count":1,"_id":"667fda1ded0dc0016c5ac705","product":"6428e5e6dc1175abc65ca084","price":499},{"count":1,"_id":"667fe2b9ed0dc0016c5accf5","product":"6428ebc6dc1175abc65ca0b9","price":170}]
/// totalCartPrice : 669

class CartEntity {
  CartEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.totalCartPrice,});

  CartEntity.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartItemEntity.fromJson(v));
      });
    }
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartItemEntity>? products;
  int? totalCartPrice;
CartEntity copyWith({  String? id,
  String? cartOwner,
  List<CartItemEntity>? products,
  int? totalCartPrice,
}) => CartEntity(  id: id ?? this.id,
  cartOwner: cartOwner ?? this.cartOwner,
  products: products ?? this.products,
  totalCartPrice: totalCartPrice ?? this.totalCartPrice,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

}