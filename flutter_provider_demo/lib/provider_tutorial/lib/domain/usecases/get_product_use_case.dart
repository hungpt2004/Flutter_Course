import 'package:flutter_provider_demo/provider_tutorial/lib/domain/repository/product_repository.dart';
import '../../../../providers/product.dart';
import '../model/product.dart';

class GetProductsUseCase {

  final ProductRepository productRepository;

  GetProductsUseCase(this.productRepository);

  Future<List<Product1>> getProducts() async {
    return await productRepository.getProducts();
  }

}