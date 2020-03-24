import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  final String mealType;
  final Color color;
  const MealDetail({Key key, 
  @required this.mealType,
  @required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text(mealType),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(mealType),
        backgroundColor: color,
      ),
      // backgroundColor: ,
      body: Center(child: Icon(Icons.local_pizza, color: color, size: 150,)),
    );
  }
}