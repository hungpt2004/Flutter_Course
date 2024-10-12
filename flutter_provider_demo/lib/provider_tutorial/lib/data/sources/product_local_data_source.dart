import '../../domain/model/product.dart';

class ProductLocalDataSource {

  Future<List<Product1>> fetchProducts() async {
    return [
      Product1(id: 1, name: 'Laptop', price: 1200),
      Product1(id: 2, name: 'Phone', price: 800),
      Product1(id: 3, name: 'Headphones', price: 200),
    ];
  }

}