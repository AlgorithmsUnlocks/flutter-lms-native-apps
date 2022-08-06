import 'package:flutter/material.dart';
import 'package:trainingtalenew/Model/product_model.dart';

class CourseCategories extends StatefulWidget {

  const CourseCategories({Key? key}) : super(key: key);

  @override
  _CourseCategoriesState createState() => _CourseCategoriesState();
}

class _CourseCategoriesState extends State<CourseCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 250,
        height: 290,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),

        ),
      child: Column(
        children: [
          ClipRect(
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height *0.3),
              child: Image.network('https://trainingtale.org/wp-content/uploads/2021/08/PTLLS-Level-3-Award-in-Education-and-Training-1024x615.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            margin: EdgeInsets.only(left: 5,bottom: 2,right: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4,),
                Text('categories',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
