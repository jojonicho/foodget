import 'package:flutter/material.dart';

class CardItemModel {

  String cardTitle;
  IconData icon;
  int tasksRemaining;
  bool taskCompletion;
  // double taskCompletion;

  CardItemModel(this.cardTitle, this.icon, this.tasksRemaining, this.taskCompletion);

}