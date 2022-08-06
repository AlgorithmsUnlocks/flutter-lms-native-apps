import 'package:flutter/material.dart';
import 'package:trainingtalenew/Model/product_model.dart';

class CourseCard extends StatelessWidget {

  final Product product;

  const CourseCard({
    Key? key,
    required this.product,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      //color: Colors.blueAccent,
      height: 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.blueAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,2),
                )
              ],
            ),
            child: Container(
              margin: EdgeInsets.only(right: 5,left: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.circular(22),
              ),
            ),
          ),

          Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                height: 200,
                width: 160,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
          ),

          Positioned(
            bottom: 0,
              left: 0,
              top: 20,
              child: SizedBox(
                height: 136,
                width: size.width-180,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                          product.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '\$${Product.product[0].price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        Product.product[0].categories,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.video_library_rounded),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
          ),

        ],
      ),
    );
  }
}

