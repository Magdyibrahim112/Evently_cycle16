import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imagePath;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imagePath,
  });
 static List<CategoryModel> categoriesWithAll = [
    CategoryModel(id: "0", name: "All", icon: Icons.all_inclusive_rounded, imagePath: "imagePath"),
    CategoryModel(id: "1", name: "Sports", icon: Icons.sports_football_rounded, imagePath: "imagePath"),
    CategoryModel(id: "2", name: "Birthday", icon: Icons.cake_rounded, imagePath: "imagePath"),
    CategoryModel(id: "3", name: "Meeting", icon: Icons.laptop_mac_rounded, imagePath: "imagePath"),
    CategoryModel(id: "4", name: "Gaming", icon: Icons.gamepad_rounded, imagePath: "imagePath"),
    CategoryModel(id: "5", name: "Eating", icon: Icons.local_pizza_rounded, imagePath: "imagePath"),
    CategoryModel(id: "6", name: "Holiday", icon: Icons.holiday_village_rounded, imagePath: "imagePath"),
    CategoryModel(id: "7", name: "Exhibition", icon: Icons.water_drop_rounded, imagePath: "imagePath"),
    CategoryModel(id: "8", name: "workshop", icon: Icons.workspaces_rounded, imagePath: "imagePath"),
    CategoryModel(id: "9", name: "Book Club", icon: Icons.book_online_rounded, imagePath: "imagePath"),


  ];
 static List<CategoryModel> categories = [
    CategoryModel(id: "0", name: "All", icon: Icons.all_inclusive_rounded, imagePath: "imagePath"),
    CategoryModel(id: "1", name: "Sports", icon: Icons.sports_football_rounded, imagePath: "imagePath"),
    CategoryModel(id: "2", name: "Birthday", icon: Icons.cake_rounded, imagePath: "imagePath"),
    CategoryModel(id: "3", name: "Meeting", icon: Icons.laptop_mac_rounded, imagePath: "imagePath"),
    CategoryModel(id: "4", name: "Gaming", icon: Icons.gamepad_rounded, imagePath: "imagePath"),
    CategoryModel(id: "5", name: "Eating", icon: Icons.local_pizza_rounded, imagePath: "imagePath"),
    CategoryModel(id: "6", name: "Holiday", icon: Icons.holiday_village_rounded, imagePath: "imagePath"),
    CategoryModel(id: "7", name: "Exhibition", icon: Icons.water_drop_rounded, imagePath: "imagePath"),
    CategoryModel(id: "8", name: "workshop", icon: Icons.workspaces_rounded, imagePath: "imagePath"),
    CategoryModel(id: "9", name: "Book Club", icon: Icons.book_online_rounded, imagePath: "imagePath"),


  ];

}
