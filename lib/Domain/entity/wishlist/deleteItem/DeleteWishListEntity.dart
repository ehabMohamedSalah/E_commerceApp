/// status : "success"
/// statusMsg : "error"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9","6428ead5dc1175abc65ca0ad","6428e7ecdc1175abc65ca090","6428cbd5dc1175abc65ca037","6428ce55dc1175abc65ca043"]

class DeleteWishlistEntity {
  DeleteWishlistEntity({
      this.status, 
      this.statusMsg, 
      this.message, 
      this.data,});

   String? status;
  String? statusMsg;
  String? message;
  List<String>? data;


}