import 'package:flutter/material.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/avilable_size.dart';
import 'cart_details.dart';

class Detailsscreen extends StatelessWidget {
  final Product product;
  const Detailsscreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 36.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red.shade100),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
          const SizedBox(height: 36.0),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$' '${product.price}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Avilable Size",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: const [
                    AvilableSize(size: "US 6"),
                    AvilableSize(size: "US 7"),
                    AvilableSize(size: "US 8"),
                    AvilableSize(size: "US 9"),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Avilable Colors",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.black,
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.grey,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(children: [
            Text(
              '\$' '${product.price}',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                provider.toggleProduct(product);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartDetails(),
                  ),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text("add to cart"),
            ),
          ]),
        ),
      ),
    );
  }
}
