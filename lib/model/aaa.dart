import 'dart:convert';

class Aaa {
  bool? status;
  String? message;
  dynamic data;

  Aaa({this.status, this.message, this.data});

  @override
  String toString() {
    return 'Aaa(status: $status, message: $message, data: $data)';
  }

  factory Aaa.fromMap(Map<String, dynamic> data) => Aaa(
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
  /// Parses the string and returns the resulting Json object as [Aaa].
  factory Aaa.fromJson(String data) {
    return Aaa.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Aaa] to a JSON string.
  String toJson() => json.encode(toMap());
}
