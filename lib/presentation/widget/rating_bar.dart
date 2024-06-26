import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getsport/data/functions.dart';
import 'package:provider/provider.dart';

class CustomeRatingBar extends StatelessWidget {
  bool isConst;
  double? itemSized;
  double initialRating;
  CustomeRatingBar(
      {super.key,
      this.itemSized,
      required this.isConst,
      required this.initialRating,
    });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return RatingBar.builder(
          ignoreGestures: isConst,
          initialRating: initialRating,
          itemSize: itemSized??20,
          itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber[600],
              ),
          onRatingUpdate: (index) {
            if (!isConst) {
             Provider.of<DBFunctions>(context,listen: false).changeRating(index);
            }
          });
    });
  }

  

  static rating(double value) {
    switch (value) {
      case >= 0 && < 20:
        {
          return 1.0;
        }
      case >= 20 && < 40:
        {
          return 2.0;
        }
      case >= 40 && < 60:
        {
          return 3.0;
        }
      case >= 60 && < 80:
        {
          return 4.0;
        }
      case >= 80:
        {
          return 5.0;
        }
    }
  }
}
