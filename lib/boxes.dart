import 'package:hive_flutter/hive_flutter.dart';

import 'model/local/user_local_model.dart';


late Box boxUser;
final Box<LocalUser> userBox = Hive.box<LocalUser>('userBox');