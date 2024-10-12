import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_demo/provider_tutorial/lib/domain/usecases/get_product_use_case.dart';

import '../../domain/model/product.dart';

class ProductProvider extends ChangeNotifier {

  final GetProductsUseCase getProductsUseCase;
  List<Product1> _products = [];

  //Method get products list
  List<Product1> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProductProvider({required this.getProductsUseCase});

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    _products = await getProductsUseCase.getProducts();

    _isLoading = false;
    notifyListeners();
  }


}