import 'package:flutter/material.dart';
import 'package:trainingtalenew/Model/models.dart';
import 'package:trainingtalenew/widgets/Course_card.dart';
import 'package:trainingtalenew/Model/product_model.dart';

class CourseCardCarousel extends StatelessWidget {

  final List<Product>product;

  const CourseCardCarousel({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      //width: 400,
      child: ListView.builder(
      //  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:
       // 10.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context,index){
          return Padding(
           padding: const EdgeInsets.only(right: 0.0),
            child: CourseCard(product:
            product[index]
            ),
          );
        },
      ),
    );
  }
}
