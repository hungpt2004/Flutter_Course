import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';
import '../constant/constant_key_stripe.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(double price) async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(price, "vnd");
      if (paymentIntentClientSecret == null) {
        // Handle the case where the payment intent creation failed
        print('Failed to create payment intent');
        return;
      }
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Pham Trong Hung",
        ),
      );
      await _processPayment();
    } catch (e) {
      // Better error handling
      print('Error in makePayment: $e');
    }
  }

  Future<String?> _createPaymentIntent(double amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency,
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          },
        ),
      );
      if (response.data != null) {
        return response.data["client_secret"];
      }
    } catch (e) {
      print('Error creating payment intent: $e');
    }
    return null;
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print('Error processing payment: $e');
    }
  }

  String _calculateAmount(double amount) {
    final calculatedAmount = (amount * 100).toInt(); // Ensure it's an integer
    return calculatedAmount.toString();
  }
}
