import 'package:flutter/material.dart';
import 'package:trainingtalenew/Model/product_model.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 150,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60.0,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,2),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 65.0,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${Product.product[0].price}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.add_circle),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
