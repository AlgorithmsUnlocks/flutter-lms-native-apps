import 'package:flutter/material.dart';
import 'package:trainingtalenew/Model/product_card.dart';
import 'package:trainingtalenew/Model/product_model.dart';

class ProductCarousel extends StatelessWidget {

  final List<Product>product;

  const ProductCarousel({
    Key? key,
    required this.product,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:
        10.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: ProductCard(product:
            product[index]
            ),
          );
        },
      ),
    );
  }
}