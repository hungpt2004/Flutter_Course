import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_shopping_cart/presentation/view/screen/cart_screen.dart';
import 'package:flutter_shopping_cart/presentation/view/screen/product_screen.dart';

import '../../../data/model/product.dart';
import 'favorite_screen.dart';

class ProductListScreen extends StatefulWidget {

  ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Product> products = [
    Product(id: "1", name: 'Product 1', price: 20.0),
    Product(id: "2", name: 'Product 2', price: 35.0),
    Product(id: "3", name: 'Product 3', price: 50.0),
    Product(id: "4", name: 'Product 4', price: 80.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(), // Navigate to Favorites
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price}"),
            trailing: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: product.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                // Add or remove from favorites
                if (product.isFavorite) {
                  CartBloc.removeFavorite(context, product);
                } else {
                  CartBloc.addFavourite(context, product);
                }
                setState(() {
                  product.isFavorite;
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
