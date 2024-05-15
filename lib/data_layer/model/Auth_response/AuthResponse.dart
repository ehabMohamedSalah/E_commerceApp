import 'package:e_commerce/Domain/entity/Auth_Response/AuthEntity.dart';

import 'UserModel.dart';

/// message : "success"
/// statusMsg : "fail"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedsalah2@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDQyMWM3ZDlkNzY2MDI3NWJmMGIyNiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE1NzQxMTI3LCJleHAiOjE3MjM1MTcxMjd9.3ksCxv7uvu4qvIt5scoq8M1EIji-4sJrOVwK8Mri0Zc"

class AuthResponseModel {
  AuthResponseModel({
      this.message, 
      this.statusMsg, 
      this.user, 
      this.token,});

  AuthResponseModel.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  UserModel? user;
  String? token;
AuthResponseModel copyWith({  String? message,
  String? statusMsg,
  UserModel? user,
  String? token,
}) => AuthResponseModel(  message: message ?? this.message,
  statusMsg: statusMsg ?? this.statusMsg,
  user: user ?? this.user,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResponseEntity toAuthEntity(){
    return AuthResponseEntity(
      token: token,
      user: user?.toUserEntity(),
    );
  }

}