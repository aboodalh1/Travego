class PlaceModel {
  PlaceModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  PlaceModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
PlaceModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => PlaceModel(  message: message ?? this.message,
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
      this.name, 
      this.description, 
      this.country, 
      this.city, 
      this.openingTime, 
      this.closingTime, 
      this.location,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    country = json['country'];
    city = json['city'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  num? id;
  String? name;
  String? description;
  String? country;
  String? city;
  String? openingTime;
  String? closingTime;
  Location? location;
Body copyWith({  num? id,
  String? name,
  String? description,
  String? country,
  String? city,
  String? openingTime,
  String? closingTime,
  Location? location,
}) => Body(  id: id ?? this.id,
  name: name ?? this.name,
  description: description ?? this.description,
  country: country ?? this.country,
  city: city ?? this.city,
  openingTime: openingTime ?? this.openingTime,
  closingTime: closingTime ?? this.closingTime,
  location: location ?? this.location,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['country'] = country;
    map['city'] = city;
    map['openingTime'] = openingTime;
    map['closingTime'] = closingTime;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }

}

class Location {
  Location({
      this.id, 
      this.latitude, 
      this.longitude,});

  Location.fromJson(dynamic json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  num? id;
  num? latitude;
  num? longitude;
Location copyWith({  num? id,
  num? latitude,
  num? longitude,
}) => Location(  id: id ?? this.id,
  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}