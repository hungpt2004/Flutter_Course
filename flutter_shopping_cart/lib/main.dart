import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_shopping_cart/presentation/view/screen/product_list_screen.dart';
import 'package:flutter_shopping_cart/service/payment/constant/constant_key_stripe.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  await _setup();
  runApp(MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: MaterialApp(
        title: 'Shopping Cart',
        home: ProductListScreen(), // The first screen is the product list
      ),
    );
  }
}
