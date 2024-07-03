import 'CartModel.dart';

/// status : "success"
/// numOfCartItems : 4
/// data : {"_id":"6683b05aed0dc0016c6f9e3b","cartOwner":"6407cf6f515bdcf347c09f17","products":[{"count":1,"_id":"668450a4ed0dc0016c717d44","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e884dc1175abc65ca096","title":"Woman Shawl","quantity":228,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402563605-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.2,"id":"6428e884dc1175abc65ca096"},"price":349},{"count":1,"_id":"668450a5ed0dc0016c717d4b","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428e997dc1175abc65ca0a1"},"price":149},{"count":1,"_id":"66845775ed0dc0016c7184c7","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e319dc1175abc65ca06d","title":"Woman Karma Socks Multicolour","quantity":117,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680401176411-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.3,"id":"6428e319dc1175abc65ca06d"},"price":199},{"count":1,"_id":"66845776ed0dc0016c7184d3","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e479dc1175abc65ca078","title":"Woman Socks","quantity":117,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680401528864-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.3,"id":"6428e479dc1175abc65ca078"},"price":199}],"createdAt":"2024-07-02T07:46:34.518Z","updatedAt":"2024-07-02T19:39:34.160Z","__v":7,"totalCartPrice":896}

class GetCartResponse {
  GetCartResponse({
      this.status, 
      this.numOfCartItems, 
      this.data,});

  GetCartResponse.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartModell.fromJson(json['data']) : null;
  }
  String? status;
  int? numOfCartItems;
  CartModell? data;
GetCartResponse copyWith({  String? status,
  int? numOfCartItems,
  CartModell? data,
}) => GetCartResponse(  status: status ?? this.status,
  numOfCartItems: numOfCartItems ?? this.numOfCartItems,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}