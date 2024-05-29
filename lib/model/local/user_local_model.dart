import 'package:hive/hive.dart';

part 'user_local_model.g.dart';

@HiveType(typeId: 0)
class LocalUser {
  @HiveField(0)
  num? id;

  @HiveField(1)
  String? firstName;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? creationDate;

  @HiveField(5)
  String? phoneNumber;

  LocalUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.creationDate,
    this.phoneNumber,
  });

  LocalUser.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    creationDate = json['creationDate'];
    phoneNumber = json['phone_number'];
  }

  LocalUser copyWith({
    num? id,
    String? firstName,
    String? lastName,
    String? email,
    String? creationDate,
    String? phoneNumber,
  }) =>
      LocalUser(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        creationDate: creationDate ?? this.creationDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['creationDate'] = creationDate;
    map['phone_number'] = phoneNumber;
    return map;
  }
}
