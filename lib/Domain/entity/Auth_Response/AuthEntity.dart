import 'User.dart';

/// statusMsg : "fail"
/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedsalah2@gmail.com"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDQyMWM3ZDlkNzY2MDI3NWJmMGIyNiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE1NzQxMTI3LCJleHAiOjE3MjM1MTcxMjd9.3ksCxv7uvu4qvIt5scoq8M1EIji-4sJrOVwK8Mri0Zc"

class AuthResponseEntity {
  AuthResponseEntity({
      this.user, 
      this.token,});

  UserEntity? user;
  String? token;


}