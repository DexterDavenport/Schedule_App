import 'package:flutter/material.dart';

class Event {
  final String title;
  // final String description;
  final DateTime from;
  final DateTime to;
  final Color bacgroudColor;

  const Event({
    required this.title,
    // this.description,
    required this.from,
    required this.to,
    this.bacgroudColor = Colors.lightGreen, 
    required description,
  });

  static Event fromJson(Map<String, dynamic> json) => Event(
      from: (json['startTime'] as DateTime),
      to: (json['endTime'] as DateTime),
      title: json['subject'],
      description: json['description']);
      
}
