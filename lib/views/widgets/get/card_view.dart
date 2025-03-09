import 'package:fake_store/models/all_product_model.dart';
import 'package:fake_store/views/widgets/get/product_card.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.product});

  final AllProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProductCard(product: product),
        Positioned(
          top: -85,
          left: 10,
          right: 10,
          child: Image.network(product.image, width: 130, height: 130),
        ),
      ],
    );
  }
}
