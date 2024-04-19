package com.example.travego

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.paypal_native_checkout"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "initialize") {
                val clientId = call.argument<String>("clientId")
                val environment = call.argument<String>("environment")
                val returnUrl = call.argument<String>("returnUrl")
                // Initialize PayPalNativeCheckoutClient here
                // Example:
                // val coreConfig = CoreConfig(clientId, if (environment == "SANDBOX") Environment.SANDBOX else Environment.PRODUCTION)
                // val payPalNativeClient = PayPalNativeCheckoutClient(
                //     application,
                //     coreConfig,
                //     returnUrl
                // )
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }
}
