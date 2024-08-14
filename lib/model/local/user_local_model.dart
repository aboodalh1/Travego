import 'package:hive/hive.dart';

part 'user_local_model.g.dart';

@HiveType(typeId: 0)
class LocalUser {
  @HiveField(0)
  num? id_user;

  @HiveField(1)
  String? firstName_user;

  @HiveField(2)
  String? lastName_user;

  @HiveField(3)
  String? email_user;

  @HiveField(4)
  String? creationDate_user;

  @HiveField(5)
  String? phoneNumber_user;

  LocalUser({
    this.id_user,
    this.firstName_user,
    this.lastName_user,
    this.email_user,
    this.creationDate_user,
    this.phoneNumber_user,
  });


}
