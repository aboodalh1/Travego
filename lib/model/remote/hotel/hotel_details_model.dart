class HotelDetailsModel {
  HotelDetailsModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  HotelDetailsModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
HotelDetailsModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => HotelDetailsModel(  message: message ?? this.message,
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
      this.startTime, 
      this.endTime, 
      this.priceForExtraBed, 
      this.distanceFromCity, 
      this.breakfastPrice, 
      this.photos, 
      this.hotel, 
      this.room, 
      this.commentReviews, 
      this.hotelServices, 
      this.photo, 
      this.security, 
      this.location, 
      this.facilities, 
      this.cleanliness, 
      this.averageRating,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    priceForExtraBed = json['priceForExtraBed'];
    distanceFromCity = json['distanceFromCity'];
    breakfastPrice = json['breakfastPrice'];
    photos = json['photos'];
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
    if (json['room'] != null) {
      room = [];
      json['room'].forEach((v) {
        room?.add(Room.fromJson(v));
      });
    }

    if (json['hotelServices'] != null) {
      hotelServices = [];
      json['hotelServices'].forEach((v) {
        hotelServices?.add(HotelServices.fromJson(v));
      });
    }
    if (json['photo'] != null) {
      photo = [];
      json['photo'].forEach((v) {
        photo?.add(Photo.fromJson(v));
      });
    }
    security = json['security'];
    location = json['location'];
    facilities = json['facilities'];
    cleanliness = json['cleanliness'];
    averageRating = json['averageRating'];
  }
  num? id;
  String? startTime;
  String? endTime;
  num? priceForExtraBed;
  num? distanceFromCity;
  num? breakfastPrice;
  dynamic photos;
  Hotel? hotel;
  List<Room>? room;
  List<dynamic>? commentReviews;
  List<HotelServices>? hotelServices;
  List<Photo>? photo;
  num? security;
  num? location;
  num? facilities;
  num? cleanliness;
  num? averageRating;
Body copyWith({  num? id,
  String? startTime,
  String? endTime,
  num? priceForExtraBed,
  num? distanceFromCity,
  num? breakfastPrice,
  dynamic photos,
  Hotel? hotel,
  List<Room>? room,
  List<dynamic>? commentReviews,
  List<HotelServices>? hotelServices,
  List<Photo>? photo,
  num? security,
  num? location,
  num? facilities,
  num? cleanliness,
  num? averageRating,
}) => Body(  id: id ?? this.id,
  startTime: startTime ?? this.startTime,
  endTime: endTime ?? this.endTime,
  priceForExtraBed: priceForExtraBed ?? this.priceForExtraBed,
  distanceFromCity: distanceFromCity ?? this.distanceFromCity,
  breakfastPrice: breakfastPrice ?? this.breakfastPrice,
  photos: photos ?? this.photos,
  hotel: hotel ?? this.hotel,
  room: room ?? this.room,
  commentReviews: commentReviews ?? this.commentReviews,
  hotelServices: hotelServices ?? this.hotelServices,
  photo: photo ?? this.photo,
  security: security ?? this.security,
  location: location ?? this.location,
  facilities: facilities ?? this.facilities,
  cleanliness: cleanliness ?? this.cleanliness,
  averageRating: averageRating ?? this.averageRating,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['priceForExtraBed'] = priceForExtraBed;
    map['distanceFromCity'] = distanceFromCity;
    map['breakfastPrice'] = breakfastPrice;
    map['photos'] = photos;
    if (hotel != null) {
      map['hotel'] = hotel?.toJson();
    }
    if (room != null) {
      map['room'] = room?.map((v) => v.toJson()).toList();
    }
    if (commentReviews != null) {
      map['commentReviews'] = commentReviews?.map((v) => v.toJson()).toList();
    }
    if (hotelServices != null) {
      map['hotelServices'] = hotelServices?.map((v) => v.toJson()).toList();
    }
    if (photo != null) {
      map['photo'] = photo?.map((v) => v.toJson()).toList();
    }
    map['security'] = security;
    map['location'] = location;
    map['facilities'] = facilities;
    map['cleanliness'] = cleanliness;
    map['averageRating'] = averageRating;
    return map;
  }

}

class Photo {
  Photo({
      this.id, 
      this.fileName, 
      this.filePath, 
      this.fileType, 
      this.fileSize, 
      this.relationType, 
      this.relationId,});

  Photo.fromJson(dynamic json) {
    id = json['id'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    fileType = json['fileType'];
    fileSize = json['fileSize'];
    relationType = json['relationType'];
    relationId = json['relationId'];
  }
  num? id;
  String? fileName;
  String? filePath;
  String? fileType;
  num? fileSize;
  String? relationType;
  num? relationId;
Photo copyWith({  num? id,
  String? fileName,
  String? filePath,
  String? fileType,
  num? fileSize,
  String? relationType,
  num? relationId,
}) => Photo(  id: id ?? this.id,
  fileName: fileName ?? this.fileName,
  filePath: filePath ?? this.filePath,
  fileType: fileType ?? this.fileType,
  fileSize: fileSize ?? this.fileSize,
  relationType: relationType ?? this.relationType,
  relationId: relationId ?? this.relationId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fileName'] = fileName;
    map['filePath'] = filePath;
    map['fileType'] = fileType;
    map['fileSize'] = fileSize;
    map['relationType'] = relationType;
    map['relationId'] = relationId;
    return map;
  }

}

class HotelServices {
  HotelServices({
      this.id, 
      this.name,});

  HotelServices.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
HotelServices copyWith({  num? id,
  String? name,
}) => HotelServices(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class Room {
  Room({
      this.id, 
      this.numOfBed, 
      this.space, 
      this.maxNumOfPeople, 
      this.price, 
      this.roomServices, 
      this.type,});

  Room.fromJson(dynamic json) {
    id = json['id'];
    numOfBed = json['num_of_bed'];
    space = json['space'];
    maxNumOfPeople = json['maxNumOfPeople'];
    price = json['price'];

    type = json['type'];
  }
  num? id;
  num? numOfBed;
  num? space;
  num? maxNumOfPeople;
  num? price;
  List<dynamic>? roomServices;
  String? type;
Room copyWith({  num? id,
  num? numOfBed,
  num? space,
  num? maxNumOfPeople,
  num? price,
  List<dynamic>? roomServices,
  String? type,
}) => Room(  id: id ?? this.id,
  numOfBed: numOfBed ?? this.numOfBed,
  space: space ?? this.space,
  maxNumOfPeople: maxNumOfPeople ?? this.maxNumOfPeople,
  price: price ?? this.price,
  roomServices: roomServices ?? this.roomServices,
  type: type ?? this.type,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['num_of_bed'] = numOfBed;
    map['space'] = space;
    map['maxNumOfPeople'] = maxNumOfPeople;
    map['price'] = price;
    if (roomServices != null) {
      map['roomServices'] = roomServices?.map((v) => v.toJson()).toList();
    }
    map['type'] = type;
    return map;
  }

}

class Hotel {
  Hotel({
      this.hotelId, 
      this.hotelName, 
      this.numOfRooms, 
      this.stars, 
      this.cityId, 
      this.cityName, 
      this.countryId, 
      this.country, 
      this.description, 
      this.photo,});

  Hotel.fromJson(dynamic json) {
    hotelId = json['hotelId'];
    hotelName = json['hotelName'];
    numOfRooms = json['num_of_rooms'];
    stars = json['stars'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    countryId = json['countryId'];
    country = json['country'];
    description = json['description'];
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
  }
  num? hotelId;
  String? hotelName;
  num? numOfRooms;
  num? stars;
  num? cityId;
  String? cityName;
  num? countryId;
  String? country;
  String? description;
  Photo? photo;
Hotel copyWith({  num? hotelId,
  String? hotelName,
  num? numOfRooms,
  num? stars,
  num? cityId,
  String? cityName,
  num? countryId,
  String? country,
  String? description,
  Photo? photo,
}) => Hotel(  hotelId: hotelId ?? this.hotelId,
  hotelName: hotelName ?? this.hotelName,
  numOfRooms: numOfRooms ?? this.numOfRooms,
  stars: stars ?? this.stars,
  cityId: cityId ?? this.cityId,
  cityName: cityName ?? this.cityName,
  countryId: countryId ?? this.countryId,
  country: country ?? this.country,
  description: description ?? this.description,
  photo: photo ?? this.photo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hotelId'] = hotelId;
    map['hotelName'] = hotelName;
    map['num_of_rooms'] = numOfRooms;
    map['stars'] = stars;
    map['cityId'] = cityId;
    map['cityName'] = cityName;
    map['countryId'] = countryId;
    map['country'] = country;
    map['description'] = description;
    if (photo != null) {
      map['photo'] = photo?.toJson();
    }
    return map;
  }

}

class Photos {
  Photos({
      this.id, 
      this.fileName, 
      this.filePath, 
      this.fileType, 
      this.fileSize, 
      this.relationType, 
      this.relationId,});

  Photos.fromJson(dynamic json) {
    id = json['id'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    fileType = json['fileType'];
    fileSize = json['fileSize'];
    relationType = json['relationType'];
    relationId = json['relationId'];
  }
  num? id;
  String? fileName;
  String? filePath;
  String? fileType;
  num? fileSize;
  String? relationType;
  num? relationId;
Photo copyWith({  num? id,
  String? fileName,
  String? filePath,
  String? fileType,
  num? fileSize,
  String? relationType,
  num? relationId,
}) => Photo(  id: id ?? this.id,
  fileName: fileName ?? this.fileName,
  filePath: filePath ?? this.filePath,
  fileType: fileType ?? this.fileType,
  fileSize: fileSize ?? this.fileSize,
  relationType: relationType ?? this.relationType,
  relationId: relationId ?? this.relationId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fileName'] = fileName;
    map['filePath'] = filePath;
    map['fileType'] = fileType;
    map['fileSize'] = fileSize;
    map['relationType'] = relationType;
    map['relationId'] = relationId;
    return map;
  }

}