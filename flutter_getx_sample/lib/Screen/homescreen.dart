import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/itesm_model.dart';
import '../Services/get_controller.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(

            child: Obx(
              () {
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return GridView.builder(
                    itemCount: productController.productItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return ProductItemsDisplay(
                        product: productController.productItems[index],
                      );
                    },
                  );
                }
              },
            ),

          ),
        ],
      ),
    );
  }
}

class ProductItemsDisplay extends StatelessWidget {
  final Product product;
  const ProductItemsDisplay({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(
                    product.image,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              maxLines: 1,

              overflow: TextOverflow
                  .ellipsis, // if the title is more then two line it show ... ,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                  child: Row(
                    children: [
                      Text(
                        product.rating.rate.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Text(
                  product.category.name.toLowerCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "\$${product.price}",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
