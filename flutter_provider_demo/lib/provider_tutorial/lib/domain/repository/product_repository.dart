import 'package:flutter_provider_demo/provider_tutorial/lib/domain/model/product.dart';

abstract class ProductRepository {
  Future<List<Product1>> getProducts();
}