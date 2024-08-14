class WalletModel {
  WalletModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  WalletModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
WalletModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => WalletModel(  message: message ?? this.message,
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
      this.balance, 
      this.bankAccount,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    balance = json['balance'];
    bankAccount = json['bankAccount'];
  }
  num? id;
  num? balance;
  String? bankAccount;
Body copyWith({  num? id,
  num? balance,
  String? bankAccount,
}) => Body(  id: id ?? this.id,
  balance: balance ?? this.balance,
  bankAccount: bankAccount ?? this.bankAccount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['balance'] = balance;
    map['bankAccount'] = bankAccount;
    return map;
  }

}