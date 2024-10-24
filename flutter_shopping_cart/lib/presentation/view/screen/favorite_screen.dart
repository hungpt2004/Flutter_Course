import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/data/model/product.dart';
import 'package:flutter_shopping_cart/presentation/bloc/cart_bloc.dart';

import '../../bloc/cart_state.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {

          final favoriteProducts = state.items.where((product) => product.isFavorite).toList();

          if (favoriteProducts.isEmpty) {
            return Center(
              child: Text("No favorite products added yet!"),
            );
          }

          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              return ListTile(
                title: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white.withOpacity(0.5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(2,5)
                        )
                      ]
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(product.name)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
