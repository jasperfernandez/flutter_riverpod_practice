import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        product.image,
                        width: 60,
                        height: 60,
                      ),
                      Text(product.title),
                      const SizedBox(width: 10),
                      const Expanded(child: SizedBox()),
                      Text('₱${product.price}'),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(product.title),
                      //     Text('\$${product.price}'),
                      //   ],
                      // ),
                    ],
                  ),
                );
              }).toList(), // output cart products here
            ),

            // output totals here
            const SizedBox(height: 10),
            Text('Total: ₱$total'),
          ],
        ),
      ),
    );
  }
}
