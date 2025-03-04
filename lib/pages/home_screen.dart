import 'package:ecommerce_app/models/my_product.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Our Products",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "All"),
              _buildProductCategory(index: 1, name: "Jackets"),
              _buildProductCategory(index: 2, name: "Sneakers"),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
              child: isSelected == 0
                  ? _buildProductGrid()
                  : isSelected == 1
                      ? _buildJackets()
                      : _buildSneakers()), // Ensures GridView is scrollable
        ],
      ),
    );
  }

  Widget _buildProductCategory({required int index, required String name}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
        });
      },
      child: Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected == index ? Colors.red : Colors.red.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    List<Product> filteredProducts = _getFilteredProducts();

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProducts.allProducts[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detailsscreen(product: allProducts),
              ),
            ),
            child: ProductCard(product: allProducts),
          );
        });
  }

  List<Product> _getFilteredProducts() {
    if (isSelected == 1) {
      return MyProducts.allProducts
          .where((product) => product.category == "Jacket")
          .toList();
    } else if (isSelected == 2) {
      return MyProducts.allProducts
          .where((product) => product.category == "Sneaker")
          .toList();
    }
    return MyProducts.allProducts; // Default to all products
  }

  _buildJackets() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.jacketsList.length,
        itemBuilder: (context, index) {
          final jacketList = MyProducts.jacketsList[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detailsscreen(product: jacketList)),
            ),
            child: ProductCard(product: jacketList),
          );
        },
      );

  _buildSneakers() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.sneakersList.length,
        itemBuilder: (context, index) {
          final sneakersList = MyProducts.sneakersList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailsscreen(product: sneakersList),
                ),
              );
            },
            child: ProductCard(product: sneakersList),
          );
        },
      );
}
