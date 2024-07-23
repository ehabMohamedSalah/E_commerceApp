import '../../../../Domain/entity/wishlist/get_wishlist_entity/ProductEntityWish.dart';
import 'Subcategory.dart';
import 'Category.dart';
import 'Brand.dart';

/// sold : 5396
/// images : ["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ebc6dc1175abc65ca0b9"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 225
/// price : 170
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:43:18.400Z"
/// updatedAt : "2024-07-22T17:36:47.666Z"
/// __v : 0
/// id : "6428ebc6dc1175abc65ca0b9"

class ProductModelWishList {
  ProductModelWishList({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
       });

  ProductModelWishList.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
   }
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;

ProductModelWishList copyWith({  int? sold,
  List<String>? images,
  List<Subcategory>? subcategory,
  int? ratingsQuantity,
  String? id,
  String? title,
  String? slug,
  String? description,
  int? quantity,
  int? price,
  String? imageCover,
  Category? category,
  Brand? brand,
  double? ratingsAverage,
  String? createdAt,
  String? updatedAt,
  int? v,
 }) => ProductModelWishList(  sold: sold ?? this.sold,
  images: images ?? this.images,
  subcategory: subcategory ?? this.subcategory,
  ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
  id: id ?? this.id,
  title: title ?? this.title,
  slug: slug ?? this.slug,
  description: description ?? this.description,
  quantity: quantity ?? this.quantity,
  price: price ?? this.price,
  imageCover: imageCover ?? this.imageCover,
  category: category ?? this.category,
  brand: brand ?? this.brand,
  ratingsAverage: ratingsAverage ?? this.ratingsAverage,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  v: v ?? this.v,
 );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
     return map;
  }
  ProductEntityResponse toProductEntityResponse(){
      return ProductEntityResponse(
      id: id,
      price: price,
       title: title,
       ratingsAverage: ratingsAverage,
      imageCover: imageCover,
      description: description,
      slug: slug,
      sold: sold,
      ratingsQuantity: ratingsQuantity,
      quantity: quantity,
      images: images,

    );
  }

}