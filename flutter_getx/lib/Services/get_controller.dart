import 'package:flutter_getx_restapi/Services/services.dart';
import 'package:get/get.dart';
import '../Model/itesm_model.dart';

class ProductConroller extends GetxController {
  var productItems = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productItems.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
