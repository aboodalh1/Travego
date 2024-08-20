class ReservationDetailsModel {
  ReservationDetailsModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });
  late final String message;
  late final String status;
  late final String localDateTime;
  late final Body body;

  ReservationDetailsModel.fromJson(Map<String, dynamic> json){
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
    required this.visaPHOTO,
    required this.firstname,
    required this.birthdate,
    required this.visaCountry,
    required this.visaType,
    required this.visaIssueDate,
    required this.passportPHOTO,
    required this.lastname,
    required this.passportNumber,
    required this.fathername,
    required this.visaExpiresDate,
    required this.passportIssueDate,
    required this.passportExpiresDate,
    required this.personalIdentityPHOTO,
    required this.mothername,
  });
  late final String visaPHOTO;
  late final String firstname;
  late final String birthdate;
  late final String visaCountry;
  late final String visaType;
  late final String visaIssueDate;
  late final String passportPHOTO;
  late final String lastname;
  late final String passportNumber;
  late final String fathername;
  late final String visaExpiresDate;
  late final String passportIssueDate;
  late final String passportExpiresDate;
  late final String personalIdentityPHOTO;
  late final String mothername;

  Body.fromJson(Map<String, dynamic> json){
    visaPHOTO = json['visa_PHOTO'];
    firstname = json['firstname'];
    birthdate = json['birthdate'];
    visaCountry = json['visa_Country'];
    visaType = json['visa_Type'];
    visaIssueDate = json['visa_Issue_date'];
    passportPHOTO = json['passport_PHOTO'];
    lastname = json['lastname'];
    passportNumber = json['passport_Number'];
    fathername = json['fathername'];
    visaExpiresDate = json['visa_Expires_date'];
    passportIssueDate = json['passport_Issue_date'];
    passportExpiresDate = json['passport_Expires_date'];
    personalIdentityPHOTO = json['personalIdentity_PHOTO'];
    mothername = json['mothername'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['visa_PHOTO'] = visaPHOTO;
    _data['firstname'] = firstname;
    _data['birthdate'] = birthdate;
    _data['visa_Country'] = visaCountry;
    _data['visa_Type'] = visaType;
    _data['visa_Issue_date'] = visaIssueDate;
    _data['passport_PHOTO'] = passportPHOTO;
    _data['lastname'] = lastname;
    _data['passport_Number'] = passportNumber;
    _data['fathername'] = fathername;
    _data['visa_Expires_date'] = visaExpiresDate;
    _data['passport_Issue_date'] = passportIssueDate;
    _data['passport_Expires_date'] = passportExpiresDate;
    _data['personalIdentity_PHOTO'] = personalIdentityPHOTO;
    _data['mothername'] = mothername;
    return _data;
  }
}