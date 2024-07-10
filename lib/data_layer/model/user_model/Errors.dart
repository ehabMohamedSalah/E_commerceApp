/// value : "668eb7d2ed0dc0016c9600d"
/// msg : "Invalid ID "
/// param : "id"
/// location : "params"

class Errors {
  Errors({
      this.value, 
      this.msg, 
      this.param, 
      this.location,});

  Errors.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }
  String? value;
  String? msg;
  String? param;
  String? location;
Errors copyWith({  String? value,
  String? msg,
  String? param,
  String? location,
}) => Errors(  value: value ?? this.value,
  msg: msg ?? this.msg,
  param: param ?? this.param,
  location: location ?? this.location,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }

}