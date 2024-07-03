import 'CartEntity.dart';

/// message : "Product added successfully to your cart"
/// numOfCartItems : 2
/// data : {"_id":"667a2db1ed0dc0016c3591ab","cartOwner":"6407cf6f515bdcf347c09f17","products":[{"count":1,"_id":"667fda1ded0dc0016c5ac705","product":"6428e5e6dc1175abc65ca084","price":499},{"count":1,"_id":"667fe2b9ed0dc0016c5accf5","product":"6428ebc6dc1175abc65ca0b9","price":170}],"totalCartPrice":669}

class CartResponseEntity {
  CartResponseEntity({
    this.status,
    this.statusMsg,
      this.message, 
      this.numOfCartItems, 
      this.data,});

    String? status;
    String? statusMsg;
   String? message;
  int? numOfCartItems;
  CartEntity? data;


}