import '../../../Domain/entity/ProductEntity/SubcategoryEntity.dart';

/// _id : "6407f243b575d3b90bf957ac"
/// name : "Men's Clothing"
/// slug : "men's-clothing"
/// category : "6439d5b90049ad0b52b90048"

class Subcategory {
  Subcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;
Subcategory copyWith({  String? id,
  String? name,
  String? slug,
  String? category,
}) => Subcategory(  id: id ?? this.id,
  name: name ?? this.name,
  slug: slug ?? this.slug,
  category: category ?? this.category,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
  SubcategoryEntity toSubcategoryEntity(){
    return SubcategoryEntity(
      category: category,
      id: id,
      slug: slug,
      name: name,
    );
  }

}