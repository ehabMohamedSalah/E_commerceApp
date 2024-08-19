import 'DeleteCartEntity.dart';

/// status : "success"
/// numOfCartItems : 1
/// data : {"_id":"66a023aaed0dc0016cc7ba76","cartOwner":"667ee243ed0dc0016c568ee9","products":[{"count":1,"_id":"66a023aded0dc0016cc7ba92","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428e997dc1175abc65ca0a1"},"price":149}],"totalCartPrice":149}

class DeleteCartResponseEntity {
  DeleteCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.data,});

   String? status;
  int? numOfCartItems;
  DeleteCartEntity? data;

}