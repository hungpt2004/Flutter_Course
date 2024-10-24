import 'package:http/http.dart' as http;

class StripeService{
  static final String apiBase = 'https://api.stripe.com/v1';
  static final String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret = "sk_test_51Q9zmKRoBpzUIPIOjvulCHjK0KMGJygG8Kn5ZsAYdCpYfQ5BJDGsdH1QOl0YQoC3TT3YNgfyHIOzwQYBq6n4yD0x00QrSvgvXI";

  static Map<String, String> headers = {
    "Authorization": 'Bearer ${StripeService.secret}'
    "Content-Type" 'application/x-ww-form- urderl loaf',
  };

  static init(){
    // StripeService.p
  }
}

