import 'package:flutter/material.dart';
import 'package:trainingtalenew/Model/Review_model.dart';
import 'package:trainingtalenew/Model/models.dart';

class ReviewesCarouselCard extends StatelessWidget {

  final Reviews reviews;

  const ReviewesCarouselCard({
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0,
          vertical: 10.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(reviews.imageUrl,
                  fit: BoxFit.fill, width: 400.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                  EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                  child: Text(
                    reviews.name,
                    style:
                    Theme.of(context).textTheme.headline2!.copyWith(

                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ),
            ],

          )),
    );
  }
}
