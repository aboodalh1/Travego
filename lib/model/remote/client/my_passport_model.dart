class MyPassportModel {
  MyPassportModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  MyPassportModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
MyPassportModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => MyPassportModel(  message: message ?? this.message,
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
      this.relationshipId, 
      this.type, 
      this.firstName, 
      this.lastName, 
      this.issueDate, 
      this.expiryDate, 
      this.passportNumber,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    relationshipId = json['relationshipId'];
    type = json['type'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    issueDate = json['passport_issue_date'];
    expiryDate = json['passport_expires_date'];
    passportNumber = json['passport_number'];
  }
  num? id;
  num? relationshipId;
  String? type;
  String? firstName;
  String? lastName;
  String? issueDate;
  String? expiryDate;
  String? passportNumber;
Body copyWith({  num? id,
  num? relationshipId,
  String? type,
  String? firstName,
  String? lastName,
  String? issueDate,
  String? expiryDate,
  String? passportNumber,
}) => Body(  id: id ?? this.id,
  relationshipId: relationshipId ?? this.relationshipId,
  type: type ?? this.type,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  issueDate: issueDate ?? this.issueDate,
  expiryDate: expiryDate ?? this.expiryDate,
  passportNumber: passportNumber ?? this.passportNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['relationshipId'] = relationshipId;
    map['type'] = type;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['issueDate'] = issueDate;
    map['expiryDate'] = expiryDate;
    map['passportNumber'] = passportNumber;
    return map;
  }

}