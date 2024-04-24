import 'dart:convert';

class UserModel {
  bool? status;
  String? message;
  dynamic data;

  UserModel({this.status, this.message, this.data});

  @override
  String toString() {
    return 'Aaa(status: $status, message: $message, data: $data)';
  }

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        status: data['status'] as bool?,
        message: data['message'] as String?,
        data: data['data'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
