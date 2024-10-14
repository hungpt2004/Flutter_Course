import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_shopping_cart/presentation/view/screen/product_list_screen.dart';

void main() {
  runApp(MyApp());
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
