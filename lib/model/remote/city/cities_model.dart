class CitiesModel {
  CitiesModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  CitiesModel.fromJson(dynamic json) {
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
CitiesModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  List<Body>? body,
}) => CitiesModel(  message: message ?? this.message,
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
      this.id, 
      this.cityName, 
      this.countryName,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    cityName = json['cityName'];
    countryName = json['countryName'];
  }
  num? id;
  String? cityName;
  String? countryName;
Body copyWith({  num? id,
  String? cityName,
  String? countryName,
}) => Body(  id: id ?? this.id,
  cityName: cityName ?? this.cityName,
  countryName: countryName ?? this.countryName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cityName'] = cityName;
    map['countryName'] = countryName;
    return map;
  }

}