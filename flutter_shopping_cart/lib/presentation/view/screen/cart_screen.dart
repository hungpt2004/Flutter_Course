// cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../service/payment/constant/constant_key_stripe.dart';
import '../../../service/payment/service/payment_service.dart';
import '../../bloc/cart_bloc.dart';
import '../../bloc/cart_event.dart';
import '../../bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    _setup(); // Gọi hàm _setup khi khởi tạo CartScreen
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    Stripe.publishableKey = stripePublishableKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty || state is CartUpdated) {
            return Center(child: Text('Your cart is empty.'));
          } else {
            return Column(
              children: [
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                            'Quantity: ${item.quantity} - \$${item.price} each'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (item.quantity > 1) {
                                  // BlocProvider.of<CartBloc>(context).add(UpdateQuantity(item.id, item.quantity - 1));
                                  CartBloc.updateDecrementQuantity(context, item);
                                } else {
                                  CartBloc.removeProduct(context, item);
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                CartBloc.updateIncrementQuantity(context, item);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                CartBloc.removeProduct(context, item);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          StripeService.instance.makePayment(state.totalPrice);
                        },
                        child: Text("Payment"))),
              ],
            );
          }

        },
      ),
    );
  }
}
