class PassengerInfoModel {
  PassengerInfoModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      required this.body,});

  PassengerInfoModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    if (json['body'] != null) {
      body = [];
      json['body'].forEach((v) {
        body.add(Body.fromJson(v));
      });
    }
  }
  String? message;
  String? status;
  String? localDateTime;
  List<Body> body=[];
PassengerInfoModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  List<Body>? body,
}) => PassengerInfoModel(  message: message ?? this.message,
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
      map['body'] = body?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Body {
  Body({
      this.id, 
      this.client, 
      this.firstName, 
      this.lastName, 
      this.fatherName, 
      this.motherName, 
      this.gender, 
      this.birthdate, 
      this.uniqueName,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    uniqueName = json['uniqueName'];
  }
  num? id;
  Client? client;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? gender;
  String? birthdate;
  String? uniqueName;
Body copyWith({  num? id,
  Client? client,
  String? firstName,
  String? lastName,
  String? fatherName,
  String? motherName,
  String? gender,
  String? birthdate,
  String? uniqueName,
}) => Body(  id: id ?? this.id,
  client: client ?? this.client,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  fatherName: fatherName ?? this.fatherName,
  motherName: motherName ?? this.motherName,
  gender: gender ?? this.gender,
  birthdate: birthdate ?? this.birthdate,
  uniqueName: uniqueName ?? this.uniqueName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (client != null) {
      map['client'] = client?.toJson();
    }
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['father_name'] = fatherName;
    map['mother_name'] = motherName;
    map['gender'] = gender;
    map['birthdate'] = birthdate;
    map['uniqueName'] = uniqueName;
    return map;
  }

}

class Client {
  Client({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.theusername, 
      this.email, 
      this.creationDate, 
      this.phoneNumber,});

  Client.fromJson(dynamic json) {
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
Client copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? theusername,
  String? email,
  String? creationDate,
  String? phoneNumber,
}) => Client(  id: id ?? this.id,
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