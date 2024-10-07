import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    // Safely access the arguments using ?. and handle null scenario
    final productId = ModalRoute.of(context)?.settings.arguments as String?;

    // If productId is null, we could show an error screen or redirect
    if (productId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Product Not Found')),
        body: const Center(child: Text('No product found!')),
      );
    }

    // Use 'listen: false' to prevent rebuild issues
    final loadedProduct = Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  loadedProduct.imageUrl,
                  width: 300,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                loadedProduct.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                loadedProduct.description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          )),
    );
  }
}
