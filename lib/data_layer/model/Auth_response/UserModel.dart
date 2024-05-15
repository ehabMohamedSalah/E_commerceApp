import 'package:e_commerce/Domain/entity/Auth_Response/User.dart';

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedsalah2@gmail.com"
/// role : "user"

class UserModel {
  UserModel({
      this.name, 
      this.email, 
      this.role,});

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;
UserModel copyWith({  String? name,
  String? email,
  String? role,
}) => UserModel(  name: name ?? this.name,
  email: email ?? this.email,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
    UserEntity toUserEntity(){
    return UserEntity(
      name: name,
      email: email,
    );
}

}