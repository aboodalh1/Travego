class PassengerPassportModel {
  PassengerPassportModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  PassengerPassportModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
PassengerPassportModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => PassengerPassportModel(  message: message ?? this.message,
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
      this.passport_issue_date,
      this.passport_expires_date,
      this.passportNumber,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    relationshipId = json['relationshipId'];
    type = json['type'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    passport_issue_date = json['passport_issue_date'];
    passport_expires_date = json['passport_expires_date'];
    passportNumber = json['passportNumber'];
  }
  num? id;
  num? relationshipId;
  String? type;
  String? firstName;
  String? lastName;
  String? passport_issue_date;
  String? passport_expires_date;
  String? passportNumber;
Body copyWith({  num? id,
  num? relationshipId,
  String? type,
  String? firstName,
  String? lastName,
  String? passport_issue_date,
  String? passport_expires_date,
  String? passportNumber,
}) => Body(  id: id ?? this.id,
  relationshipId: relationshipId ?? this.relationshipId,
  type: type ?? this.type,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  passport_issue_date: passport_issue_date ?? this.passport_issue_date,
  passport_expires_date: passport_expires_date ?? this.passport_expires_date,
  passportNumber: passportNumber ?? this.passportNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['relationshipId'] = relationshipId;
    map['type'] = type;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['passport_issue_date'] = passport_issue_date;
    map['passport_expires_date'] = passport_expires_date;
    map['passportNumber'] = passportNumber;
    return map;
  }

}