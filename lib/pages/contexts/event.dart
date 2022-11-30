import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime fron;
  final DateTime to;
  final Color bacgroudColor;
  final bool isAllDay;

  const Event({
    required this.title, 
    required this.description, 
    required this.fron, 
    required this.to, 
    this.bacgroudColor = Colors.lightGreen, 
    this.isAllDay = false
  });
}