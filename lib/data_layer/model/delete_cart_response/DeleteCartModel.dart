import 'package:injectable/injectable.dart';

import '../../../Domain/entity/DeleteCartResponseEntity/DeleteCartEntity.dart';
import 'Products.dart';

/// _id : "66a023aaed0dc0016cc7ba76"
/// cartOwner : "667ee243ed0dc0016c568ee9"
/// products : [{"count":1,"_id":"66a023aded0dc0016cc7ba92","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428e997dc1175abc65ca0a1"},"price":149}]
/// createdAt : "2024-07-23T21:42:02.420Z"
/// updatedAt : "2024-07-23T21:45:37.836Z"
/// __v : 3
/// totalCartPrice : 149

class DeleteCartModel {
  DeleteCartModel({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  DeleteCartModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
DeleteCartModel copyWith({  String? id,
  String? cartOwner,
  List<Products>? products,
  String? createdAt,
  String? updatedAt,
  int? v,
  int? totalCartPrice,
}) => DeleteCartModel(  id: id ?? this.id,
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

}