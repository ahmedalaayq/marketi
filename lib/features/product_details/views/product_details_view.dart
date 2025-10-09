import 'package:flutter/material.dart';
import 'package:marketi/features/home/models/product_model.dart';

import 'widgets/custom_product_details_bottom_section.dart';
import 'widgets/custom_top_product_details_section.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel? product;
  const ProductDetailsView({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      return const Scaffold(
        body: Center(child: Text('No product provided')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 120.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: CustomTopProductDetailsSection(product: product!,),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomProductDetailsBottomSection(productModel: product!,),
          ),
        ],
      ),
    );
  }
}
