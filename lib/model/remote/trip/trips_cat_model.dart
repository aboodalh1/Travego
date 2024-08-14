class TripByCatModel {
  TripByCatModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });
  late final String message;
  late final String status;
  late final String localDateTime;
  late final List<Body> body;

  TripByCatModel.fromJson(Map<String, dynamic> json){
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
    required this.tripId,
    required this.tripName,
    required this.tripDescription,
    required this.tripCategory,
    required this.tripStartDate,
    required this.tripEndDate,
    required this.country,
    required this.cities,
    required this.hotels,
    required this.flightCompany,
    required this.minPassengers,
    required this.maxPassengers,
    required this.status,
    required this.tripServices,
    required this.price,
    required this.isPrivate,
    this.isFavourite,
  });
  late final int tripId;
  late final String tripName;
  late final String tripDescription;
  late final String tripCategory;
  late final String tripStartDate;
  late final String tripEndDate;
  late final String country;
  late final List<String> cities;
  late final List<String> hotels;
  late final String flightCompany;
  late final int minPassengers;
  late final int maxPassengers;
  late final String status;
  late final List<String> tripServices;
  late final int price;
  late final String isPrivate;
  late final Null isFavourite;

  Body.fromJson(Map<String, dynamic> json){
    tripId = json['tripId'];
    tripName = json['tripName'];
    tripDescription = json['tripDescription'];
    tripCategory = json['tripCategory'];
    tripStartDate = json['tripStartDate'];
    tripEndDate = json['tripEndDate'];
    country = json['country'];
    cities = List.castFrom<dynamic, String>(json['cities']);
    hotels = List.castFrom<dynamic, String>(json['hotels']);
    flightCompany = json['flightCompany'];
    minPassengers = json['min_passengers'];
    maxPassengers = json['max_passengers'];
    status = json['status'];
    tripServices = List.castFrom<dynamic, String>(json['tripServices']);
    price = json['price'];
    isPrivate = json['isPrivate'];
    isFavourite = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tripId'] = tripId;
    _data['tripName'] = tripName;
    _data['tripDescription'] = tripDescription;
    _data['tripCategory'] = tripCategory;
    _data['tripStartDate'] = tripStartDate;
    _data['tripEndDate'] = tripEndDate;
    _data['country'] = country;
    _data['cities'] = cities;
    _data['hotels'] = hotels;
    _data['flightCompany'] = flightCompany;
    _data['min_passengers'] = minPassengers;
    _data['max_passengers'] = maxPassengers;
    _data['status'] = status;
    _data['tripServices'] = tripServices;
    _data['price'] = price;
    _data['isPrivate'] = isPrivate;
    _data['isFavourite'] = isFavourite;
    return _data;
  }
}