import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/data/model/product.dart';
import 'package:flutter_shopping_cart/main.dart';

import 'cart_event.dart';
import 'cart_state.dart';
import 'package:bloc/bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
    CartBloc() : super(CartState(items: [], totalPrice: 0.0)) {
      on<AddProduct>(_onAddProduct);
      on<RemoveProduct>(_onRemoveProduct);
      on<UpdateQuantity>(_onUpdateQuantity);
      on<AddFavoriteProduct>(_onAddFavoriteProduct);
      on<RemoveFavoriteProduct>(_onRemoveFavoriteProduct);
    }

    void _onAddProduct(AddProduct event, Emitter<CartState> emit) {
      final existingProductIndex = state.items.indexWhere((item) => item.id == event.product.id); //Return index of product chosen if do not have return -1
      List<Product> products = state.items;

      //Check exist product
      if(existingProductIndex >= 0) {
        products[existingProductIndex].quantity++;
      } else {
        products.add(event.product);
      }
      
      emit(CartState(items: products, totalPrice: _calculateTotalPrice(products)));
      
    }
    
    void _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit) {
      final removedProduct = state.items.where((items) => items.id != event.productId).toList();
      emit(CartState(items: removedProduct, totalPrice: _calculateTotalPrice(removedProduct)));
    }
    
    void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit){
      final updatingProduct = state.items.map((items) {
        if(items.id == event.productId){
          items.quantity = event.quantity;
        }
        return items;
      }).toList();
      emit(CartState(items: updatingProduct, totalPrice: _calculateTotalPrice(updatingProduct)));

    }

    void _onAddFavoriteProduct(AddFavoriteProduct event, Emitter<CartState> emit){
      final products = state.items.map((items) {
        if(items.id == event.product.id){
          items.isFavorite = true;
        }
        return items;
      }).toList();
      emit(CartState(items: products, totalPrice: _calculateTotalPrice(products)));
    }

    void _onRemoveFavoriteProduct(RemoveFavoriteProduct event, Emitter<CartState> emit){
      final products = state.items.map((items) {
        if(items.id == event.productId){
          items.isFavorite = false;
        }
        return items;
      }).toList();
      emit(CartState(items: products, totalPrice: _calculateTotalPrice(products)));
    }

    double _calculateTotalPrice(List<Product> product){
      double total = 0;
      for(Product p in product){
        total += p.price * p.quantity;
      }
      return total;
    }




    //BLOC STATIC
    static void addProduct(BuildContext context, Product product) {
      context.read<CartBloc>().add(AddProduct(product));
    }
    static void removeProduct(BuildContext context, Product product) {
      context.read<CartBloc>().add(RemoveProduct(product.id));
    }
    static void addFavourite(BuildContext context, Product product) {
      context.read<CartBloc>().add(AddFavoriteProduct(product));
    }
    static void removeFavorite(BuildContext context, Product product) {
      context.read<CartBloc>().add(RemoveFavoriteProduct(product.id));
    }
    static void updateIncrementQuantity(BuildContext context, Product product) {
      context.read<CartBloc>().add(UpdateQuantity(product.id,product.quantity + 1));
    }
    static void updateDecrementQuantity(BuildContext context, Product product) {
      context.read<CartBloc>().add(UpdateQuantity(product.id,product.quantity - 1));
    }

}