import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color bacgroudColor;
 

  const Event({
    required this.title, 
    required this.description, 
    required this.from, 
    required this.to, 
    this.bacgroudColor = Colors.lightGreen, 
  });
}