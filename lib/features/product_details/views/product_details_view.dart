import 'package:flutter/material.dart';
import 'package:marketi/features/product_details/views/widgets/custom_product_details_bottom_section.dart';
import 'package:marketi/features/product_details/views/widgets/custom_top_product_details_section.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 120.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: CustomTopProductDetailsSection(),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: CustomProductDetailsBottomSection(),
          ),
        ],
      ),
    );
  }
}
