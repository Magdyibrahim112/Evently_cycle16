import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app_online/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  String id;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;
  //TimeOfDay timeOfDay;

  EventModel({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    //required this.timeOfDay,
  });

  EventModel.fromJson(Map<String, dynamic> json, BuildContext context)
    : this(
        id: json["id"],
        category: CategoryModel.getCategories(
          context,
        ).firstWhere((category) => category.id == json["categoryId"]),
        ///where دى بتجيب اوبجكت اوبجكت من داخل ال list
        ///وبعد كدا بترجعلك ال list بتاعتك
        ///where => دى بتجيب اوبجكت اوبجكت من داخل ال list
        ///firstWhere => لكن دى هتجيب اول اوبجكت بى match ال criteria
        title: json["title"],
        description: json["description"],
        dateTime: (json["dateTime"] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryId": category.id,
    "title": title,
    "description": description,
    "dateTime": dateTime,
  };
}
