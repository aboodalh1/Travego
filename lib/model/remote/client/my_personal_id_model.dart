class PassengerPersonalIdModel {
  PassengerPersonalIdModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  PassengerPersonalIdModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
PassengerPersonalIdModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => PassengerPersonalIdModel(  message: message ?? this.message,
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
      this.birthDate, 
      this.nationality,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    relationshipId = json['relationshipId'];
    type = json['type'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthDate = json['birthDate'];
    nationality = json['nationality'];
  }
  num? id;
  num? relationshipId;
  String? type;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? nationality;
Body copyWith({  num? id,
  num? relationshipId,
  String? type,
  String? firstName,
  String? lastName,
  String? birthDate,
  String? nationality,
}) => Body(  id: id ?? this.id,
  relationshipId: relationshipId ?? this.relationshipId,
  type: type ?? this.type,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  birthDate: birthDate ?? this.birthDate,
  nationality: nationality ?? this.nationality,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['relationshipId'] = relationshipId;
    map['type'] = type;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['birthDate'] = birthDate;
    map['nationality'] = nationality;
    return map;
  }

}