import 'package:evently_app_online/core/resources/assets_manager.dart';
import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/features/main_layout/profile/custom_drop_down_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36.r)),
          ),
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Row(
              children: [
                Image.asset(ImageAssets.profileImage),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Magdy Ibrahim",
                        style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.white,
                        ),
                      ),
                      Text(
                        "magdy@gmail.com",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        CustomDropDownItem(
          label: "Theme",
          selectedLabel: "Light",
          menuItems: ["Light", "Dark"],
        ),
        SizedBox(height: 16.h),
        CustomDropDownItem(
          label: "Language",
          selectedLabel: "English",
          menuItems: ["English", "عربى"],
        ),
        Spacer(flex: 7),
        Container(
          margin: REdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              backgroundColor: ColorsManager.red,
              foregroundColor: ColorsManager.white,
              textStyle: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: ColorsManager.white,
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 8.w),
                Text("Logout"),
              ],
            ),
          ),
        ),
        Spacer(flex: 3),
      ],
    );
  }
}
