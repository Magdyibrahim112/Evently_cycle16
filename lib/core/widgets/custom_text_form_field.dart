import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    required this.keyboardType,
    this.isSecure = false,
  });
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool isSecure;///Optional

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure,
      style: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.black1C,
        fontWeight: FontWeight.w400,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        //prefixIcon: prefixIcon == null ? null : Icon(prefixIcon ),
        //suffixIcon:suffixIcon == null ? null : Icon(suffixIcon),
      ),
    );
  }
}
