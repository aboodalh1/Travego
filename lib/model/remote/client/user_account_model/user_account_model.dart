class UserAccountModel {
  UserAccountModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  UserAccountModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
UserAccountModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => UserAccountModel(  message: message ?? this.message,
  status: status ?? this.status,
  localDateTime: localDateTime ?? this.localDateTime,
  body: body ?? this.body,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    map['localDateTime'] = localDateTime;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }

}

class Body {
  Body({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.theusername, 
      this.email, 
      this.creationDate, 
      this.phoneNumber,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    theusername = json['theusername'];
    email = json['email'];
    creationDate = json['creationDate'];
    phoneNumber = json['phone_number'];
  }
  num? id;
  String? firstName;
  String? lastName;
  String? theusername;
  String? email;
  String? creationDate;
  String? phoneNumber;
Body copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? theusername,
  String? email,
  String? creationDate,
  String? phoneNumber,
}) => Body(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  theusername: theusername ?? this.theusername,
  email: email ?? this.email,
  creationDate: creationDate ?? this.creationDate,
  phoneNumber: phoneNumber ?? this.phoneNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['theusername'] = theusername;
    map['email'] = email;
    map['creationDate'] = creationDate;
    map['phone_number'] = phoneNumber;
    return map;
  }

}