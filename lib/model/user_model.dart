class UserModel {
  UserModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });
  late final String message;
  late final String status;
  late final String localDateTime;
  late final UserBody body;

  UserModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = UserBody.fromJson(json['body']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['localDateTime'] = localDateTime;
    _data['body'] = body.toJson();
    return _data;
  }
}

class UserBody {
  UserBody({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;

  UserBody.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['User']);
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['User'] = user.toJson();
    _data['Token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.theusername,
    required this.email,
    required this.creationDate,
    required this.phoneNumber,
    this.addAllDocs,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String theusername;
  late final String email;
  late final String creationDate;
  late final String phoneNumber;
  late final Null addAllDocs;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    theusername = json['theusername'];
    email = json['email'];
    creationDate = json['creationDate'];
    phoneNumber = json['phone_number'];
    addAllDocs = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['theusername'] = theusername;
    _data['email'] = email;
    _data['creationDate'] = creationDate;
    _data['phone_number'] = phoneNumber;
    _data['addAllDocs'] = addAllDocs;
    return _data;
  }
}