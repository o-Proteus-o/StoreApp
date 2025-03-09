import 'package:fake_store/models/all_product_model.dart';
import 'package:fake_store/views/widgets/put/update.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final AllProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.routeName, arguments: product);
      },
      child: Container(
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"$"
                      " ${product.price.toString()}",
                    ),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
