import '../../../Domain/entity/wishlist/add_wish_entity/add_Wishlist_entity.dart';

/// status : "success"
/// statusMsg : "fail"
/// message : "Product added successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9"]

class WishilistResponse {
  WishilistResponse({
      this.status, 
      this.statusMsg, 
      this.message, 
      this.data,});

  WishilistResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? status;
  String? statusMsg;
  String? message;
  List<String>? data;
WishilistResponse copyWith({  String? status,
  String? statusMsg,
  String? message,
  List<String>? data,
}) => WishilistResponse(  status: status ?? this.status,
  statusMsg: statusMsg ?? this.statusMsg,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
  WishlistEntity towishEntity(){
    return WishlistEntity(
      status: status,
      data: data,
      message: message,
    );
  }

}