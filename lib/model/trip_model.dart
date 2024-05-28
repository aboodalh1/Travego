class TripModel {
  TripModel({
      this.tripId, 
      this.tripName, 
      this.tripDescription, 
      this.tripCategory, 
      this.tripStartDate, 
      this.tripEndDate, 
      this.country, 
      this.cities, 
      this.flightCompany, 
      this.minPassengers, 
      this.maxPassengers, 
      this.status, 
      this.tripServices, 
      this.price, 
      this.isPrivate,});

  TripModel.fromJson(dynamic json) {
    tripId = json['tripId'];
    tripName = json['tripName'];
    tripDescription = json['tripDescription'];
    tripCategory = json['tripCategory'];
    tripStartDate = json['tripStartDate'];
    tripEndDate = json['tripEndDate'];
    country = json['country'];
    cities = json['cities'] != null ? json['cities'].cast<String>() : [];
    flightCompany = json['flightCompany'];
    minPassengers = json['min_passengers'];
    maxPassengers = json['max_passengers'];
    status = json['status'];
    tripServices = json['tripServices'] != null ? json['tripServices'].cast<String>() : [];
    price = json['price'];
    isPrivate = json['isPrivate'];
  }
  num? tripId;
  String? tripName;
  String? tripDescription;
  String? tripCategory;
  String? tripStartDate;
  String? tripEndDate;
  String? country;
  List<String>? cities;
  String? flightCompany;
  num? minPassengers;
  num? maxPassengers;
  String? status;
  List<String>? tripServices;
  num? price;
  String? isPrivate;
TripModel copyWith({  num? tripId,
  String? tripName,
  String? tripDescription,
  String? tripCategory,
  String? tripStartDate,
  String? tripEndDate,
  String? country,
  List<String>? cities,
  String? flightCompany,
  num? minPassengers,
  num? maxPassengers,
  String? status,
  List<String>? tripServices,
  num? price,
  String? isPrivate,
}) => TripModel(  tripId: tripId ?? this.tripId,
  tripName: tripName ?? this.tripName,
  tripDescription: tripDescription ?? this.tripDescription,
  tripCategory: tripCategory ?? this.tripCategory,
  tripStartDate: tripStartDate ?? this.tripStartDate,
  tripEndDate: tripEndDate ?? this.tripEndDate,
  country: country ?? this.country,
  cities: cities ?? this.cities,
  flightCompany: flightCompany ?? this.flightCompany,
  minPassengers: minPassengers ?? this.minPassengers,
  maxPassengers: maxPassengers ?? this.maxPassengers,
  status: status ?? this.status,
  tripServices: tripServices ?? this.tripServices,
  price: price ?? this.price,
  isPrivate: isPrivate ?? this.isPrivate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tripId'] = tripId;
    map['tripName'] = tripName;
    map['tripDescription'] = tripDescription;
    map['tripCategory'] = tripCategory;
    map['tripStartDate'] = tripStartDate;
    map['tripEndDate'] = tripEndDate;
    map['country'] = country;
    map['cities'] = cities;
    map['flightCompany'] = flightCompany;
    map['min_passengers'] = minPassengers;
    map['max_passengers'] = maxPassengers;
    map['status'] = status;
    map['tripServices'] = tripServices;
    map['price'] = price;
    map['isPrivate'] = isPrivate;
    return map;
  }

}