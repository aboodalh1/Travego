class TransactionHistoryModel {
  TransactionHistoryModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });
  late final String message;
  late final String status;
  late final String localDateTime;
  late final Body body;

  TransactionHistoryModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = Body.fromJson(json['body']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['localDateTime'] = localDateTime;
    _data['body'] = body.toJson();
    return _data;
  }
}

class Body {
  Body({
    required this.id,
    required this.wallet,
    required this.transactionAmmount,
    required this.date,
    required this.relationshipId,
    required this.type,
    required this.description,
    required this.status,
  });
  late final int id;
  late final Wallet wallet;
  late final int transactionAmmount;
  late final String date;
  late final int relationshipId;
  late final String type;
  late final String description;
  late final String status;

  Body.fromJson(Map<String, dynamic> json){
    id = json['id'];
    wallet = Wallet.fromJson(json['wallet']);
    transactionAmmount = json['transactionAmmount'];
    date = json['date'];
    relationshipId = json['relationshipId'];
    type = json['type'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['wallet'] = wallet.toJson();
    _data['transactionAmmount'] = transactionAmmount;
    _data['date'] = date;
    _data['relationshipId'] = relationshipId;
    _data['type'] = type;
    _data['description'] = description;
    _data['status'] = status;
    return _data;
  }
}

class Wallet {
  Wallet({
    required this.id,
    required this.balance,
    required this.bankAccount,
  });
  late final int id;
  late final int balance;
  late final String bankAccount;

  Wallet.fromJson(Map<String, dynamic> json){
    id = json['id'];
    balance = json['balance'];
    bankAccount = json['bankAccount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['balance'] = balance;
    _data['bankAccount'] = bankAccount;
    return _data;
  }
}