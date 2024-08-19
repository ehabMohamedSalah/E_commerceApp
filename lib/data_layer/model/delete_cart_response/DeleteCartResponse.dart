import '../../../Domain/entity/DeleteCartResponseEntity/DeleteCartResponseEntity.dart';
import 'DeleteCartModel.dart';

/// status : "success"
/// numOfCartItems : 1
/// data : {"_id":"66a023aaed0dc0016cc7ba76","cartOwner":"667ee243ed0dc0016c568ee9","products":[{"count":1,"_id":"66a023aded0dc0016cc7ba92","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428e997dc1175abc65ca0a1"},"price":149}],"createdAt":"2024-07-23T21:42:02.420Z","updatedAt":"2024-07-23T21:45:37.836Z","__v":3,"totalCartPrice":149}

class DeleteCartResponse {
  DeleteCartResponse({
      this.status, 
      this.numOfCartItems, 
      this.data,});

  DeleteCartResponse.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? DeleteCartModel.fromJson(json['data']) : null;
  }
  String? status;
  int? numOfCartItems;
  DeleteCartModel? data;
DeleteCartResponse copyWith({  String? status,
  int? numOfCartItems,
  DeleteCartModel? data,
}) => DeleteCartResponse(  status: status ?? this.status,
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