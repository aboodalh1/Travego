class FavoriteModel {
  FavoriteModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });
  late final String message;
  late final String status;
  late final String localDateTime;
  late final Body body;

  FavoriteModel.fromJson(Map<String, dynamic> json){
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
    required this.hotels,
    required this.trips,
  });
  late final List<Hotels> hotels;
  late final List<Trips> trips;

  Body.fromJson(Map<String, dynamic> json){
    hotels = List.from(json['hotels']).map((e)=>Hotels.fromJson(e)).toList();
    trips = List.from(json['trips']).map((e)=>Trips.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hotels'] = hotels.map((e)=>e.toJson()).toList();
    _data['trips'] = trips.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Hotels {
  Hotels({
    required this.hotelId,
    required this.hotelName,
    this.numOfRooms,
    required this.stars,
    required this.cityId,
    required this.cityName,
    required this.countryId,
    required this.country,
    required this.description,
    required this.photo,
  });
  late final int hotelId;
  late final String hotelName;
  late final Null numOfRooms;
  late final int stars;
  late final int cityId;
  late final String cityName;
  late final int countryId;
  late final String country;
  late final String description;
  late final Photo photo;

  Hotels.fromJson(Map<String, dynamic> json){
    hotelId = json['hotelId'];
    hotelName = json['hotelName'];
    numOfRooms = null;
    stars = json['stars'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    countryId = json['countryId'];
    country = json['country'];
    description = json['description'];
    photo = Photo.fromJson(json['photo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hotelId'] = hotelId;
    _data['hotelName'] = hotelName;
    _data['num_of_rooms'] = numOfRooms;
    _data['stars'] = stars;
    _data['cityId'] = cityId;
    _data['cityName'] = cityName;
    _data['countryId'] = countryId;
    _data['country'] = country;
    _data['description'] = description;
    _data['photo'] = photo.toJson();
    return _data;
  }
}

class Photo {
  Photo({
    required this.id,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.fileSize,
    required this.relationType,
    required this.relationId,
  });
  late final int id;
  late final String fileName;
  late final String filePath;
  late final String fileType;
  late final int fileSize;
  late final String relationType;
  late final int relationId;

  Photo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    fileType = json['fileType'];
    fileSize = json['fileSize'];
    relationType = json['relationType'];
    relationId = json['relationId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fileName'] = fileName;
    _data['filePath'] = filePath;
    _data['fileType'] = fileType;
    _data['fileSize'] = fileSize;
    _data['relationType'] = relationType;
    _data['relationId'] = relationId;
    return _data;
  }
}

class Trips {
  Trips({
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

  Trips.fromJson(Map<String, dynamic> json){
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
    return _data;
  }
}