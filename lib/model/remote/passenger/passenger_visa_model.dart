class PassengerVisaModel {
  PassengerVisaModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  PassengerVisaModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
PassengerVisaModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => PassengerVisaModel(  message: message ?? this.message,
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
      this.visaType, 
      this.country, 
      this.visa_issue_date,
      this.visa_expires_date,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    relationshipId = json['relationshipId'];
    type = json['type'];
    visaType = json['visaType'];
    country = json['country'];
    visa_issue_date = json['visa_issue_date'];
    visa_expires_date = json['visa_expires_date'];
  }
  num? id;
  num? relationshipId;
  String? type;
  String? visaType;
  String? country;
  String? visa_issue_date;
  String? visa_expires_date;
Body copyWith({  num? id,
  num? relationshipId,
  String? type,
  String? visaType,
  String? country,
  String? visa_issue_date,
  String? visa_expires_date,
}) => Body(  id: id ?? this.id,
  relationshipId: relationshipId ?? this.relationshipId,
  type: type ?? this.type,
  visaType: visaType ?? this.visaType,
  country: country ?? this.country,
  visa_issue_date: visa_issue_date ?? this.visa_issue_date,
  visa_expires_date: visa_expires_date ?? this.visa_expires_date,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['relationshipId'] = relationshipId;
    map['type'] = type;
    map['visaType'] = visaType;
    map['country'] = country;
    map['visa_issue_date'] = visa_issue_date;
    map['visa_expires_date'] = visa_expires_date;
    return map;
  }

}