import 'package:evently_app_online/core/resources/assets_manager.dart';
import 'package:evently_app_online/l10n/app_localizations.dart';
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
 static List<CategoryModel> getCategoriesWithAll(BuildContext context){
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return  [
      CategoryModel(id: "0", name: appLocalizations.all, icon: Icons.all_inclusive_rounded, imagePath: "imagePath"),
      CategoryModel(id: "1", name: appLocalizations.sports, icon: Icons.sports_football_rounded, imagePath: ImageAssets.sports),
      CategoryModel(id: "2", name: appLocalizations.birthday, icon: Icons.cake_rounded, imagePath: ImageAssets.birthday),
      CategoryModel(id: "3", name: appLocalizations.meeting, icon: Icons.laptop_mac_rounded, imagePath: ImageAssets.meeting),
      CategoryModel(id: "4", name: appLocalizations.gaming, icon: Icons.gamepad_rounded, imagePath: ImageAssets.gaming),
      CategoryModel(id: "5", name: appLocalizations.eating, icon: Icons.local_pizza_rounded, imagePath: ImageAssets.eating),
      CategoryModel(id: "6", name: appLocalizations.holiday, icon: Icons.holiday_village_rounded, imagePath: ImageAssets.holiday),
      CategoryModel(id: "7", name: appLocalizations.exhibition, icon: Icons.water_drop_rounded, imagePath: ImageAssets.exhibition),
      CategoryModel(id: "8", name: appLocalizations.workshop, icon: Icons.workspaces_rounded, imagePath: ImageAssets.workshop),
      CategoryModel(id: "9", name: appLocalizations.book_club, icon: Icons.book_online_rounded, imagePath: ImageAssets.bookClub),


    ];
  }
  static List<CategoryModel> getCategories(BuildContext context){
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return  [
      CategoryModel(id: "1", name: appLocalizations.sports, icon: Icons.sports_football_rounded, imagePath: ImageAssets.sports),
      CategoryModel(id: "2", name: appLocalizations.birthday, icon: Icons.cake_rounded, imagePath: ImageAssets.birthday),
      CategoryModel(id: "3", name: appLocalizations.meeting, icon: Icons.laptop_mac_rounded, imagePath: ImageAssets.meeting),
      CategoryModel(id: "4", name: appLocalizations.gaming, icon: Icons.gamepad_rounded, imagePath: ImageAssets.gaming),
      CategoryModel(id: "5", name: appLocalizations.eating, icon: Icons.local_pizza_rounded, imagePath: ImageAssets.eating),
      CategoryModel(id: "6", name: appLocalizations.holiday, icon: Icons.holiday_village_rounded, imagePath: ImageAssets.holiday),
      CategoryModel(id: "7", name: appLocalizations.exhibition, icon: Icons.water_drop_rounded, imagePath: ImageAssets.exhibition),
      CategoryModel(id: "8", name: appLocalizations.workshop, icon: Icons.workspaces_rounded, imagePath: ImageAssets.workshop),
      CategoryModel(id: "9", name: appLocalizations.book_club, icon: Icons.book_online_rounded, imagePath: ImageAssets.bookClub),


    ];
  }
/*
  static List<CategoryModel> categoriesWithAll = [
    CategoryModel(id: "0", name: "All", icon: Icons.all_inclusive_rounded, imagePath: "imagePath"),
    CategoryModel(id: "1", name: "Sports", icon: Icons.sports_football_rounded, imagePath: ImageAssets.sports),
    CategoryModel(id: "2", name: "Birthday", icon: Icons.cake_rounded, imagePath: ImageAssets.birthday),
    CategoryModel(id: "3", name: "Meeting", icon: Icons.laptop_mac_rounded, imagePath: ImageAssets.meeting),
    CategoryModel(id: "4", name: "Gaming", icon: Icons.gamepad_rounded, imagePath: ImageAssets.gaming),
    CategoryModel(id: "5", name: "Eating", icon: Icons.local_pizza_rounded, imagePath: ImageAssets.eating),
    CategoryModel(id: "6", name: "Holiday", icon: Icons.holiday_village_rounded, imagePath: ImageAssets.holiday),
    CategoryModel(id: "7", name: "Exhibition", icon: Icons.water_drop_rounded, imagePath: ImageAssets.exhibition),
    CategoryModel(id: "8", name: "workshop", icon: Icons.workspaces_rounded, imagePath: ImageAssets.workshop),
    CategoryModel(id: "9", name: "Book Club", icon: Icons.book_online_rounded, imagePath: ImageAssets.bookClub),


  ];
 static List<CategoryModel> categories = [
    //CategoryModel(id: "0", name: "All", icon: Icons.all_inclusive_rounded, imagePath: "imagePath"),
   CategoryModel(id: "1", name: "Sports", icon: Icons.sports_football_rounded, imagePath: ImageAssets.sports),
   CategoryModel(id: "2", name: "Birthday", icon: Icons.cake_rounded, imagePath: ImageAssets.birthday),
   CategoryModel(id: "3", name: "Meeting", icon: Icons.laptop_mac_rounded, imagePath: ImageAssets.meeting),
   CategoryModel(id: "4", name: "Gaming", icon: Icons.gamepad_rounded, imagePath: ImageAssets.gaming),
   CategoryModel(id: "5", name: "Eating", icon: Icons.local_pizza_rounded, imagePath: ImageAssets.eating),
   CategoryModel(id: "6", name: "Holiday", icon: Icons.holiday_village_rounded, imagePath: ImageAssets.holiday),
   CategoryModel(id: "7", name: "Exhibition", icon: Icons.water_drop_rounded, imagePath: ImageAssets.exhibition),
   CategoryModel(id: "8", name: "workshop", icon: Icons.workspaces_rounded, imagePath: ImageAssets.workshop),
   CategoryModel(id: "9", name: "Book Club", icon: Icons.book_online_rounded, imagePath: ImageAssets.bookClub),

 ];
*/
}
