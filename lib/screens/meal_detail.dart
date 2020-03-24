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
        elevation: 0,
        title: Hero(
          tag:mealType ,
          child: Material(
            type: MaterialType.transparency,
            child: Text(mealType, style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),)
              )
            ),
        backgroundColor: color,
      ),
      backgroundColor: color,
      body: Center(child: Icon(Icons.local_pizza, color: Colors.white, size: 150,)),
    );
  }
}