import 'package:e_commerce/Domain/entity/cart_entity_response/CartItemEntity.dart';

/// count : 1
/// _id : "667fda1ded0dc0016c5ac705"
/// product : "6428e5e6dc1175abc65ca084"
/// price : 499

class CartItemModel {
  CartItemModel({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartItemModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  int? count;
  String? id;
  String? product;
  int? price;
CartItemModel copyWith({  int? count,
  String? id,
  String? product,
  int? price,
}) => CartItemModel(  count: count ?? this.count,
  id: id ?? this.id,
  product: product ?? this.product,
  price: price ?? this.price,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

  CartItemEntity toCartItemEntity(){
    return CartItemEntity(
      id: id,
      price: price,
      count: count,
      product: product,
    );
  }

}