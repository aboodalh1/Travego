class AllReservationModel {
  AllReservationModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });
  late final String message;
  late final String status;
  late final String localDateTime;
  late final List<Body> body;

  AllReservationModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = List.from(json['body']).map((e)=>Body.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['localDateTime'] = localDateTime;
    _data['body'] = body.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Body {
  Body({
    required this.FullPrice,
    required this.Description,
    required this.TripName,
    required this.confirmationStatus,
    required this.TripReservationId,
    required this.Paid,
    required this.userEmail,
    required this.confirmationId,
  });
  late final int FullPrice;
  late final String Description;
  late final String TripName;
  late final String confirmationStatus;
  late final int TripReservationId;
  late final bool Paid;
  late final String userEmail;
  late final int confirmationId;

  Body.fromJson(Map<String, dynamic> json){
    FullPrice = json['FullPrice'];
    Description = json['Description'];
    TripName = json['TripName'];
    confirmationStatus = json['confirmationStatus'];
    TripReservationId = json['TripReservationId'];
    Paid = json['Paid'];
    userEmail = json['userEmail'];
    confirmationId = json['confirmationId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['FullPrice'] = FullPrice;
    _data['Description'] = Description;
    _data['TripName'] = TripName;
    _data['confirmationStatus'] = confirmationStatus;
    _data['TripReservationId'] = TripReservationId;
    _data['Paid'] = Paid;
    _data['userEmail'] = userEmail;
    _data['confirmationId'] = confirmationId;
    return _data;
  }
}