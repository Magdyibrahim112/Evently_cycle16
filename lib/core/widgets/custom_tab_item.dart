import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({super.key, required this.category, required this.selectedBgColor, required this.unSelectedBgColor, required this.selectedFgColor, required this.unSelectedFgColor, required this.isSelected});
  final CategoryModel category;
  final Color selectedBgColor;
  final Color unSelectedBgColor;
  final Color selectedFgColor;///Fg => forground color
  final Color unSelectedFgColor;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? selectedBgColor : unSelectedBgColor,
        borderRadius: BorderRadius.circular(46.r),
        border: Border.all(width: 2, color: selectedBgColor)
      ),
      child: Row(
        children: [
          Icon(category.icon, color: isSelected ? selectedFgColor : unSelectedFgColor),
          SizedBox(width: 8.w,),
          Text(category.name, style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: isSelected ? selectedFgColor : unSelectedFgColor),),
        ],
      ),
    );
  }
}
