import 'package:flutter/services.dart';

class PayPalNativeCheckout {
  static const MethodChannel _channel =
      const MethodChannel('com.example.paypal_native_checkout');

  static Future<void> initialize(
      String clientId, Environment environment, String s) async {
    await _channel.invokeMethod('initialize', {
      'client_id': clientId,
      'client_secret': s,
          'environment': environment.toString(),
    });
  }
}

enum Environment { SANDBOX, PRODUCTION }

class PaypalService {
  static const MethodChannel _channel =
      const MethodChannel('com.example.travego/paypal');

  Future<void> initiatePayment(double amount) async {
    try {
      final String result =
          await _channel.invokeMethod('initiatePayment', {'amount': amount});
      print("Payment result: $result");
    } on PlatformException catch (e) {
      print("Failed to initiate payment: '${e.message}'.");
    }
  }
}
