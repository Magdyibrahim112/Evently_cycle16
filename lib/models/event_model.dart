import 'package:evently_app_online/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;
  TimeOfDay timeOfDay;

  EventModel({
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.timeOfDay,
  });
}
