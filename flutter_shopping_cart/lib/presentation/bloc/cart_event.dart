import '../../data/model/product.dart';

abstract class CartEvent {}

//Remove Product have param is Product object
class AddProduct extends CartEvent {
  final Product product;

  AddProduct(this.product);
}

//Remove Product have param is Product object
class RemoveProduct extends CartEvent {
  final String productId;

  RemoveProduct(this.productId);
}

//Update Product have param is productId and update quantity
class UpdateQuantity extends CartEvent {
  final Product product;
  final int quantity;

  UpdateQuantity(this.product, this.quantity);
}

//Add Favorite
class AddFavoriteProduct extends CartEvent {
  final Product product;

  AddFavoriteProduct(this.product);
}

//Remove Favorite
class RemoveFavoriteProduct extends CartEvent {
  final String productId;

  RemoveFavoriteProduct(this.productId);
}