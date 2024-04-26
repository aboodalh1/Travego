import 'package:flutter/material.dart';
import 'package:travego/features/paypal/paypal.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await PayPalNativeCheckout.initialize(
                  "AcRX3D-Q5BmoKgBB-PH3_SwPOVn0TUrSTcWbcEKqEWOec-O9QxIagU07BYRCPiIvluFbXTSs6w0IGrgb",
                  Environment.SANDBOX,
                  "EFvR20CTo0zNFE7oqVaPQWxFan1Zor8INw9ms9IJxiqK0_-Qe3-B-LpjgWptSfRnjcKHMBqo52fcg-GB");
            },
            child: Text('Initialize PayPal'),
          ),
        ),
      ),
    );
  }
}
