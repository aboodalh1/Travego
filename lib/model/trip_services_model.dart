class TripServicesModel {
  TripServicesModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  TripServicesModel.fromJson(dynamic json) {
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
TripServicesModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  List<Body>? body,
}) => TripServicesModel(  message: message ?? this.message,
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
      this.name,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
Body copyWith({  num? id,
  String? name,
}) => Body(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}