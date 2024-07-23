import '../../../../Domain/entity/wishlist/deleteItem/DeleteWishListEntity.dart';

/// status : "success"
/// statusMsg : "error"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9","6428ead5dc1175abc65ca0ad","6428e7ecdc1175abc65ca090","6428cbd5dc1175abc65ca037","6428ce55dc1175abc65ca043"]

class DeleteWishlistResponse {
  DeleteWishlistResponse({
    this.status,
    this.statusMsg,
    this.message,
    this.data,});

  DeleteWishlistResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? status;
  String? statusMsg;
  String? message;
  List<String>? data;
  DeleteWishlistResponse copyWith({  String? status,
    String? statusMsg,
    String? message,
    List<String>? data,
  }) => DeleteWishlistResponse(  status: status ?? this.status,
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
  DeleteWishlistEntity toDeleteWishlistEntity(){
    return DeleteWishlistEntity(
      message: message,
      data: data,
      status: status,
      statusMsg: statusMsg,
    );
  }

}