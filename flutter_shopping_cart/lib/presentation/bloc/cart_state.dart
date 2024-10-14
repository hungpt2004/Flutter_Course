import '../../data/model/product.dart';

class CartState {
  final List<Product> items;
  final double totalPrice;

  CartState({required this.items, required this.totalPrice});
}
