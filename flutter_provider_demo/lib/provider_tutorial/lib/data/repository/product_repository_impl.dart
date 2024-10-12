import 'package:flutter_provider_demo/provider_tutorial/lib/data/sources/product_local_data_source.dart';
import 'package:flutter_provider_demo/provider_tutorial/lib/domain/model/product.dart';
import 'package:flutter_provider_demo/provider_tutorial/lib/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

  final ProductLocalDataSource productLocalDataSource;

  ProductRepositoryImpl(this.productLocalDataSource);

  @override
  Future<List<Product1>> getProducts() async {
    print(1);
    return await productLocalDataSource.fetchProducts();
  }

}