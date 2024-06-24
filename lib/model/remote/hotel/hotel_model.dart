// class HotelModel {
//   HotelModel({
//       this.message,
//       this.status,
//       this.localDateTime,
//       this.body,});
//
//   HotelModel.fromJson(dynamic json) {
//     message = json['message'];
//     status = json['status'];
//     localDateTime = json['localDateTime'];
//     body = json['body'] != null ? Body.fromJson(json['body']) : null;
//   }
//   String? message;
//   String? status;
//   String? localDateTime;
//   Body? body;
// HotelModel copyWith({  String? message,
//   String? status,
//   String? localDateTime,
//   Body? body,
// }) => HotelModel(  message: message ?? this.message,
//   status: status ?? this.status,
//   localDateTime: localDateTime ?? this.localDateTime,
//   body: body ?? this.body,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['message'] = message;
//     map['status'] = status;
//     map['localDateTime'] = localDateTime;
//     if (body != null) {
//       map['body'] = body?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Body {
//   Body({
//       this.hotelId,
//       this.hotelName,
//       this.numOfRooms,
//       this.stars,
//       this.city,
//       this.country,
//       this.description,
//       this.photo,});
//
//   Body.fromJson(dynamic json) {
//     hotelId = json['hotelId'];
//     hotelName = json['hotelName'];
//     numOfRooms = json['num_of_rooms'];
//     stars = json['stars'];
//     city = json['city'] != null ? City.fromJson(json['city']) : null;
//     country = json['country'] != null ? Country.fromJson(json['country']) : null;
//     description = json['description'];
//     photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
//   }
//   num? hotelId;
//   String? hotelName;
//   num? numOfRooms;
//   num? stars;
//   City? city;
//   Country? country;
//   String? description;
//   Photo? photo;
// Body copyWith({  num? hotelId,
//   String? hotelName,
//   num? numOfRooms,
//   num? stars,
//   City? city,
//   Country? country,
//   String? description,
//   Photo? photo,
// }) => Body(  hotelId: hotelId ?? this.hotelId,
//   hotelName: hotelName ?? this.hotelName,
//   numOfRooms: numOfRooms ?? this.numOfRooms,
//   stars: stars ?? this.stars,
//   city: city ?? this.city,
//   country: country ?? this.country,
//   description: description ?? this.description,
//   photo: photo ?? this.photo,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['hotelId'] = hotelId;
//     map['hotelName'] = hotelName;
//     map['num_of_rooms'] = numOfRooms;
//     map['stars'] = stars;
//     if (city != null) {
//       map['city'] = city?.toJson();
//     }
//     if (country != null) {
//       map['country'] = country?.toJson();
//     }
//     map['description'] = description;
//     if (photo != null) {
//       map['photo'] = photo?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Photo {
//   Photo({
//       this.id,
//       this.fileName,
//       this.filePath,
//       this.fileType,
//       this.fileSize,
//       this.relationType,
//       this.relationId,});
//
//   Photo.fromJson(dynamic json) {
//     id = json['id'];
//     fileName = json['fileName'];
//     filePath = json['filePath'];
//     fileType = json['fileType'];
//     fileSize = json['fileSize'];
//     relationType = json['relationType'];
//     relationId = json['relationId'];
//   }
//   num? id;
//   String? fileName;
//   String? filePath;
//   String? fileType;
//   num? fileSize;
//   String? relationType;
//   num? relationId;
// Photo copyWith({  num? id,
//   String? fileName,
//   String? filePath,
//   String? fileType,
//   num? fileSize,
//   String? relationType,
//   num? relationId,
// }) => Photo(  id: id ?? this.id,
//   fileName: fileName ?? this.fileName,
//   filePath: filePath ?? this.filePath,
//   fileType: fileType ?? this.fileType,
//   fileSize: fileSize ?? this.fileSize,
//   relationType: relationType ?? this.relationType,
//   relationId: relationId ?? this.relationId,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['fileName'] = fileName;
//     map['filePath'] = filePath;
//     map['fileType'] = fileType;
//     map['fileSize'] = fileSize;
//     map['relationType'] = relationType;
//     map['relationId'] = relationId;
//     return map;
//   }
//
// }
//
// class Country {
//   Country({
//       this.id,
//       this.name,
//       this.iso,
//       this.iso3,
//       this.dial,
//       this.currency,
//       this.currencyName,});
//
//   Country.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     iso = json['iso'];
//     iso3 = json['iso3'];
//     dial = json['dial'];
//     currency = json['currency'];
//     currencyName = json['currency_name'];
//   }
//   num? id;
//   String? name;
//   String? iso;
//   String? iso3;
//   String? dial;
//   String? currency;
//   String? currencyName;
// Country copyWith({  num? id,
//   String? name,
//   String? iso,
//   String? iso3,
//   String? dial,
//   String? currency,
//   String? currencyName,
// }) => Country(  id: id ?? this.id,
//   name: name ?? this.name,
//   iso: iso ?? this.iso,
//   iso3: iso3 ?? this.iso3,
//   dial: dial ?? this.dial,
//   currency: currency ?? this.currency,
//   currencyName: currencyName ?? this.currencyName,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['iso'] = iso;
//     map['iso3'] = iso3;
//     map['dial'] = dial;
//     map['currency'] = currency;
//     map['currency_name'] = currencyName;
//     return map;
//   }
//
// }
//
// class City {
//   City({
//       this.id,
//       this.name,
//       this.country,
//       this.trips,});
//
//   City.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     country = json['country'] != null ? Country.fromJson(json['country']) : null;
//     if (json['trips'] != null) {
//       trips = [];
//       json['trips'].forEach((v) {
//         trips?.add(Dynamic.fromJson(v));
//       });
//     }
//   }
//   num? id;
//   String? name;
//   Country? country;
//   List<dynamic>? trips;
// City copyWith({  num? id,
//   String? name,
//   Country? country,
//   List<dynamic>? trips,
// }) => City(  id: id ?? this.id,
//   name: name ?? this.name,
//   country: country ?? this.country,
//   trips: trips ?? this.trips,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     if (country != null) {
//       map['country'] = country?.toJson();
//     }
//     if (trips != null) {
//       map['trips'] = trips?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class Country1 {
//   Country1({
//       this.id,
//       this.name,
//       this.iso,
//       this.iso3,
//       this.dial,
//       this.currency,
//       this.currencyName,});
//
//   Country1.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     iso = json['iso'];
//     iso3 = json['iso3'];
//     dial = json['dial'];
//     currency = json['currency'];
//     currencyName = json['currency_name'];
//   }
//   num? id;
//   String? name;
//   String? iso;
//   String? iso3;
//   String? dial;
//   String? currency;
//   String? currencyName;
// Country copyWith({  num? id,
//   String? name,
//   String? iso,
//   String? iso3,
//   String? dial,
//   String? currency,
//   String? currencyName,
// }) => Country(  id: id ?? this.id,
//   name: name ?? this.name,
//   iso: iso ?? this.iso,
//   iso3: iso3 ?? this.iso3,
//   dial: dial ?? this.dial,
//   currency: currency ?? this.currency,
//   currencyName: currencyName ?? this.currencyName,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['iso'] = iso;
//     map['iso3'] = iso3;
//     map['dial'] = dial;
//     map['currency'] = currency;
//     map['currency_name'] = currencyName;
//     return map;
//   }
//
// }