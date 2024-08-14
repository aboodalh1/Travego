class HotelModel {
  HotelModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  HotelModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    if (json['body'] != null) {
      body = [];
      json['body'].forEach((v) {
        body?.add(Body.fromJson(v));
      });
    }
  }
  String? message;
  String? status;
  String? localDateTime;
  List<Body>? body;
HotelModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  List<Body>? body,
}) => HotelModel(  message: message ?? this.message,
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
      map['body'] = body?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Body {
  Body({
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

  Body.fromJson(dynamic json) {
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
Body copyWith({  num? hotelId,
  String? hotelName,
  num? numOfRooms,
  num? stars,
  num? cityId,
  String? cityName,
  num? countryId,
  String? country,
  String? description,
  Photo? photo,
}) => Body(  hotelId: hotelId ?? this.hotelId,
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