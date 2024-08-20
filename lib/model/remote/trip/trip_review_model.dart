class TripReviewModel {
  TripReviewModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });
  late final String message;
  late final String status;
  late final String localDateTime;
  late final Body body;

  TripReviewModel.fromJson(Map<String, dynamic> json){
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
    required this.tripId,
    required this.places,
    required this.services,
    required this.generalRating,
  });
  late final int tripId;
  late final int places;
  late final int services;
  late final int generalRating;

  Body.fromJson(Map<String, dynamic> json){
    tripId = json['tripId'];
    places = json['places'];
    services = json['services'];
    generalRating = json['generalRating'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tripId'] = tripId;
    _data['places'] = places;
    _data['services'] = services;
    _data['generalRating'] = generalRating;
    return _data;
  }
}