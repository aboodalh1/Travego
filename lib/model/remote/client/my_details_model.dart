class MyDetailsModel {
  MyDetailsModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });
  late final String message;
  late final String status;
  late final String localDateTime;
  late final Body body;

  MyDetailsModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = Body.fromJson(json['body']);
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

class Body {
  Body({
    required this.id,
    required this.client,
    required this.gender,
    required this.fatherName,
    required this.motherName,
    required this.birthdate,
  });
  late final int id;
  late final Client client;
  late final String gender;
  late final String fatherName;
  late final String motherName;
  late final String birthdate;

  Body.fromJson(Map<String, dynamic> json){
    id = json['id'];
    client = Client.fromJson(json['client']);
    gender = json['gender'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['client'] = client.toJson();
    _data['gender'] = gender;
    _data['father_name'] = fatherName;
    _data['mother_name'] = motherName;
    _data['birthdate'] = birthdate;
    return _data;
  }
}

class Client {
  Client({
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

  Client.fromJson(Map<String, dynamic> json){
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