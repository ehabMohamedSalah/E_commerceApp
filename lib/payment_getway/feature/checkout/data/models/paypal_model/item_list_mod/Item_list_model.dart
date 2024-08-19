import 'Items.dart';

/// items : [{"name":"Apple","quantity":4,"price":"10","currency":"USD"},{"name":"Pineapple","quantity":5,"price":"12","currency":"USD"}]

class ItemListModel {
  ItemListModel({
      this.items,});

  ItemListModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(OrderItemModel.fromJson(v));
      });
    }
  }
  List<OrderItemModel>? items;
ItemListModel copyWith({  List<OrderItemModel>? items,
}) => ItemListModel(  items: items ?? this.items,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}