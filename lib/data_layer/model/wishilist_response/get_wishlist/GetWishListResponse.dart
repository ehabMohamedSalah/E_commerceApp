import 'ProductModelWish.dart';

/// status : "success"
/// count : 4
/// data : [{"sold":5396,"images":["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":225,"price":170,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:43:18.400Z","updatedAt":"2024-07-22T17:36:47.666Z","__v":0,"id":"6428ebc6dc1175abc65ca0b9"},{"sold":10445,"images":["1680403156555-3.jpeg","1680403156555-2.jpeg","1680403156554-1.jpeg","1680403156556-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":220,"price":149,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:39:17.204Z","updatedAt":"2024-07-22T17:36:47.666Z","__v":0,"id":"6428ead5dc1175abc65ca0ad"},{"sold":3848,"images":["1680402411883-2.jpeg","1680402411883-3.jpeg","1680402411883-1.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":10,"_id":"6428e7ecdc1175abc65ca090","title":"Woman Bordeaux Long Sleeve Blouse BORDEAUX","slug":"woman-bordeaux-long-sleeve-blouse-bordeaux","description":"ShellFabric1 Cotton 65% Polyester 35%","quantity":228,"price":499,"priceAfterDiscount":349,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402411833-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.2,"createdAt":"2023-04-02T02:26:52.509Z","updatedAt":"2024-07-21T01:09:43.013Z","__v":0,"id":"6428e7ecdc1175abc65ca090"},{"sold":43737,"images":["1680395220690-1.jpeg","1680395220693-3.jpeg","1680395220692-2.jpeg","1680395220713-4.jpeg"],"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"ratingsQuantity":19,"_id":"6428cbd5dc1175abc65ca037","title":"Essentials Embroidered Linear Logo T-Shirt Navy","slug":"essentials-embroidered-linear-logo-t-shirt-navy","description":"Comfortable and soft cotton blend fabric\nRibbed crew neck and short sleeves\nadidas signature branding print\nWash according to care label instructions","quantity":118,"price":749,"priceAfterDiscount":504,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680395220407-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":3.8,"createdAt":"2023-04-02T00:27:01.864Z","updatedAt":"2024-07-21T10:52:54.289Z","__v":0,"id":"6428cbd5dc1175abc65ca037"}]

class GetWishListResponse {
  GetWishListResponse({
      this.status, 
      this.count, 
      this.data,});

  GetWishListResponse.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductModelWishList.fromJson(v));
      });
    }
  }
  String? status;
  int? count;
  List<ProductModelWishList>? data;
GetWishListResponse copyWith({  String? status,
  int? count,
  List<ProductModelWishList>? data,
}) => GetWishListResponse(  status: status ?? this.status,
  count: count ?? this.count,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}